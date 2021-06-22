import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../data/cart.dart';
import '../responses/user_login_response.dart';
import '../services/login.dart';
import '../data/list_order.dart';
import '../services/home.dart';

class Add_to_list extends StatefulWidget {
  @override
  _Add_to_listState createState() => _Add_to_listState();
}

class _Add_to_listState extends State<Add_to_list> {
  int selected = 1;
  int cart_len = 0;
  int Total_Cost = 0;
  int _currentIntValue = 1;
  List<TextEditingController> controlers = [];
  var args;
  String Client_name;
  UserLoginResponse _user;
  AppBar appBar;

  void profileNavigationHandler() {
    navigateToProfile(context, _user.token);
  }

  void getlist_data() async {
    var response;
    print('getting list order data');
    var dataURI = Uri.http('10.0.2.2:3000', 'orders/user/${_user.userId}');
    print("Sending get order request");
    response = await http.get(dataURI);
    print("res_order");
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    final String responseString = response.body;
    list_order list = list_order.fromJson(json.decode(responseString));
    print("orders len === ${list.getlen()}");

    Navigator.pushReplacementNamed(context, '/list', arguments: {
      'user_name': _user.userName,
      'user_type': _user.userType,
      'user_token': _user.token,
      'user_id': _user.userId,
      'order_object': list,
    });
  }

  void _onItemTapped(int index) {
    if (index == selected) return;
    setState(() {
      selected = index;
    });
    if (index == 2) {
      getlist_data();
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/add_to_list_page', arguments: {
        'user_name': _user.userName,
        'user_type': _user.userType,
        'user_token': _user.token,
        'user_id': _user.userId,
      });
    } else if (index == 0) {
      navigateToHome(
          context,
          _user);

      //Navigator.of(context)
      //.push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  void init() {
    this._user = UserLoginResponse(
      userName: args['user_name'],
      userType: args['user_type'],
      token: args['user_token'],
      userId: args['user_id'],
    );
    appBar = setAppBar(context, profileNavigationHandler, _user.userName);
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    init();
    this.Client_name = args["user_name"];
    return Scaffold(
      appBar: appBar,
      body: Container(child: Consumer<Cart>(builder: (context, cart, child) {
        this.cart_len = cart.drugs.length;
        this.controlers.clear();
        for (int r = 0; r < this.cart_len; r++) {
          TextEditingController _controller = TextEditingController();
          _controller.text = "${cart.drugs[r].quantity}";
          this.controlers.add(_controller);
        }

        return Column(
          children: [
            SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height * 55 / 100,
              child: ListView(
                children: [
                  ...Drug_list(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 15 / 100,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Total cost = ${cart.totalCost()} ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30,
                        color: Colors.white,
                        child: FloatingActionButton(
                            heroTag: 'Buy',
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {}),
                      ))
                ],
              ),
            ),
          ],
        );
      }) /**/
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Selected drugs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'History',
          ),
        ],
        currentIndex: selected,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Container> Drug_list() {
    List<Container> list = [];
    print('Drug list cart len: ${this.cart_len}');
    for (int i = 0; i < this.cart_len; i++) {
      list.add(drug(i, this.controlers[i]));
      list.add(Container(
        height: 15,
      ));
    }
    return list;
  }

  Container drug(int index, TextEditingController _controller) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Consumer<Cart>(
          builder: (context, cart, child) {
            //this.cart_len=cart.drugs.length;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 65 / 100,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 16 / 100,
                          height: MediaQuery.of(context).size.height * 9 / 100,
                          //color: Theme.of(context).primaryColor,
                          //alignment: Alignment.centerLeft,
                          /*
                      child: Container(
                        //height: 70,
                        width: 40,
                        color: Theme.of(context).primaryColor,
                        alignment: Alignment.centerLeft,
                        */
                          child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                "Drug Image",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ))
                          /*
                        Center(
                          child: Text(
                            "Drug Image",
                            style: TextStyle(fontSize: 10 , color: Colors.white),
                          ),
                        ),
                        */

                          ),
                      Padding(
                        //padding: const EdgeInsets.all(0.0),
                        padding: const EdgeInsets.fromLTRB(8.0, 5, 0, 0),
                        child: Container(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name: ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                    "${cart.drugs[index].drugName}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Unit Price: ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                    "${cart.drugs[index].price}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  //height: 40,
                  height: MediaQuery.of(context).size.height * 5 / 100,

                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          //textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.05),
                            //contentPadding: EdgeInsets.all(2.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          controller: _controller,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: false,
                            signed: true,
                          ),
                        ),
                      ),
                      Container(
                        //height: 60.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  size: 15.0,
                                ),
                                onTap: () {
                                  int currentValue =
                                      int.parse(_controller.text);
                                  setState(() {
                                    currentValue++;
                                    _controller.text = (currentValue)
                                        .toString(); // incrementing value
                                  });
                                  cart.drugs[index].quantity =
                                      cart.drugs[index].quantity + 1;
                                },
                              ),
                            ),
                            Container(
                              height: 0.0,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 15.0,
                              ),
                              onTap: () {
                                int currentValue = int.parse(_controller.text);
                                setState(() {
                                  print("Setting state");
                                  currentValue--;
                                  _controller.text =
                                      (currentValue > 0 ? currentValue : 0)
                                          .toString(); // decrementing value
                                });
                                cart.drugs[index].quantity =
                                    cart.drugs[index].quantity - 1;
                                if (cart.drugs[index].quantity < 0) {
                                  cart.drugs[index].quantity = 0;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: MediaQuery.of(context).size.height * 10 / 100,
                  width: MediaQuery.of(context).size.width * 10 / 100,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Container(
                      width: 60,
                      height: 30,
                      child: Icon(
                        Icons.delete_outline_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onTap: () {
                      cart.removeDrug(cart.drugs[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ) /**/
        );
  }
}

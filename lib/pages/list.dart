import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/Admin_orders.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/data/list_order.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/responses/user_login_response.dart';
import 'package:flutter_app_pharmacy/widgets/card_info.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'add_to-list_page.dart';
import 'order_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/services/login.dart';


class List_order extends StatefulWidget {
  @override
  _List_orderState createState() => _List_orderState();
}

class _List_orderState extends State<List_order> {
  int selected = 2;
  var args;
  list_order list;
  UserLoginResponse _user;

  void init() {
     this._user = UserLoginResponse(
                    userName: args['user_name'],
                    userType: args['user_type'],
                    token: args['user_token'],
                    userId: args['user_id'],
                  );
  }

  void _onItemTapped(int index) {
    if (index == selected) return;
    setState(() {
      selected = index;
    });
    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/add_to_list_page', arguments: {
        'user_name': _user.userName,
        'user_type': _user.userType,
        'user_token': _user.token,
        'user_id': _user.userId,
      });
    }
    else if (index == 0) {
      navigateToHome(
          context,
          UserLoginResponse(
              userName: _user.userName,
              userType: _user.userType,
              userId: _user.userId,
              token: _user.token,));
    }
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    list = args["order_object"];
    init();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Pharmacy App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
              child: Row(children: <Widget>[
            Icon(
              Icons.account_box,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            Text(
              _user.userName,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ])),
          ...item(list.orders),
        ],
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

  List<Widget> item(List<order> order) {
    List<Widget> cards = [];

    for (int y = 0; y < order.length; y++) {
      cards.add(cardInfoTemplate(order[y].order_date, "${order[y].Total_Cost}",
          order[y].order_status_name, order[y].order_id));
    }
    return cards;
  }
}

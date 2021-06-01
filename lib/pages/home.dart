import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/widgets/category.dart';
import 'package:flutter_app_pharmacy/widgets/grid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/data/list_order.dart';
import 'add_to-list_page.dart';
import 'package:vertical_navigation_bar/vertical_navigation_bar.dart';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int userId;
  int catSelected = 0;
  List<CategoryDrug> drugsByCat;
  int selected = 0;
  List<bool> isCatSelected = [];
  String c = "Category 1";
  Map args = {};
  List<Widget> categories = [];
  List<String> catNames;
  List<Drug> drugs = [];
  Widget app;
  var init;
  String userName;
  final pageController = PageController(initialPage: 0, keepPage: true);

  final List<SideNavigationItem> navItems = [];

  final initialTab = 0;

  void getlist_data() async{
    String token = UserPreferences.getString('user_token');
    print('Home SP token: $token');
    var response;
    print('getting list order data');
    var dataURI = Uri.http('10.0.2.2:3000', 'orders/user/$userId');
    print("Sending get order request");
    response = await http.get(dataURI);
    print("res_order");
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    final String responseString = response.body;
    list_order list= list_order.fromJson(json.decode(responseString));
    print("orders len == {list.getlen()}");

    Navigator.pushReplacementNamed(context, '/list', arguments: {
      'user_name': this.userName,
      'order_object':list,
    });

  }
  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
    if (index == 2) {
      //orders = getUserOrders();
      getlist_data();

    }
    if (index == 1) {
      // Cart page
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Add_to_list()));
    }
    if (index == 0) {
      // Home Page
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  void _onCategoryTapped(String name) {
    setState(() {
      c = name;
    });
  }


  String _userName() {
    print(args.runtimeType);
    print(args['user_name'].runtimeType);
    String token = UserPreferences.getString('user_token');
    String token2 = UserPreferences.getString('token');
    print('Home SP token: $token or $token2');
    return args == null ? 'Guest' : args['user_name'];
  }

  void init_page() {
    //catSelected = 0;
    //print(args.toString());
    //print(args);


    Map<String, dynamic> payload = Jwt.parseJwt(args['user_token']);

    userId = payload['user_id'];
    userName = _userName();
    print('Name: $userName, id: $userId');
    this.catNames =  (args == null || args['cat_names'] == null) ? [] : args['cat_names'];
    this.drugsByCat = (args == null || args['drugs_by_cat'] == null) ? [] : args['drugs_by_cat'];
    this.drugs = drugsByCat == null ? [] : drugsByCat[catSelected].getDrugs();
    if (this.navItems.length == 0) {
      catNames.forEach((catName) {
        //print(catName);
        categories.add(category(catName, _onCategoryTapped));
        this.navItems.add(SideNavigationItem(title: catName));
      });
    }
  }

  void updateDrugs() {
    setState(() {
      this.drugs = drugsByCat == null ? [] : drugsByCat[catSelected].getDrugs();
    });
  }

  /*
  _HomeState() {
    print('Inside constructor');
    
    print('Finished constructor');
  }
  */

  @override
  Widget build(BuildContext context) {
    print('build');
    args = ModalRoute.of(context).settings.arguments;
    init_page();
    print("Nav items length: ${navItems.length}");
    // var widgets = this.init.then((value) {
    return MaterialApp(
      title: "app",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pharmacy App'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.red,
                  ),
                  child: SideNavigation(
                    navItems: this.navItems,
                    itemSelected: (index) {
                      setState(() {
                        print('index: $index');
                        this.catSelected = index;
                        updateDrugs();
                      });

                      pageController.animateToPage(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    initialIndex: 0,
                    actions: <Widget>[],
                  ),
                )),
            Expanded(
              child: PageView.builder(
                itemCount: this.navItems.length,
                controller: pageController,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {

                  return Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 60,
                          child: Center(
                              child: Row(children: <Widget>[
                            Icon(
                              Icons.account_box,
                              color: Colors.red,
                              size: 30,
                            ),
                            Text(
                              userName,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                        ),
                        ...gridTemplate(this.drugs, showDialog),
                      ],
                    ),
                  );
                },
              ),
            )
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
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
    //}
    //);
    //widgets.then((value) => this.app = value);
    //return this.app;
  }

  void showDialog(String drug_desc) {
    print('Inside showDialog');
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              color: Colors.white,
              height: 300,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "The Drug Description",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        drug_desc,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}

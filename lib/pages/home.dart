import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/responses/user_login_response.dart';
import 'package:flutter_app_pharmacy/services/login.dart';
import 'package:flutter_app_pharmacy/widgets/category.dart';
import 'package:flutter_app_pharmacy/widgets/grid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/data/list_order.dart';
import 'package:vertical_navigation_bar/vertical_navigation_bar.dart';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';
import 'package:flutter_app_pharmacy/services/home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int userId;
  String _token;
  String userName;
  String userType;

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
  
  final pageController = PageController(initialPage: 0, keepPage: true);

  final List<SideNavigationItem> navItems = [];

  final initialTab = 0;

  void getlist_data() async {
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
    list_order list = list_order.fromJson(json.decode(responseString));
    print("orders len == {list.getlen()}");

    Navigator.pushReplacementNamed(context, '/list', arguments: {
      'user_name': this.userName,
      'order_object': list,
    });
  }

  void _onItemTapped(int index) {
    if (index == selected)
      return;
    setState(() {
      selected = index;
    });
    if (index == 2) {
      getlist_data();
    }
    else if (index == 1) {
      // Cart page
      Navigator.pushReplacementNamed(context, '/add_to_list_page', arguments: {
        'user_name': this.userName,
      });
    }
    else if (index == 0) {
      // Home Page
      navigateToHome(context, UserLoginResponse(
        token: _token,
        userName: this.userName,
        userType: this.userType,
      ));
      //Navigator.of(context)
          //.push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  void _onCategoryTapped(String name) {
    setState(() {
      c = name;
    });
  }

  String _userName() {
    _token = UserPreferences.getString('user_token');
    return args == null ? 'Guest' : args['user_name'];
  }

  void init_page() {
    Map<String, dynamic> payload = Jwt.parseJwt(args['user_token']);

    this.userId = payload['user_id'];
    this.userName = _userName();
    this.userType = payload['user_type'];
    print('Name: $userName, id: $userId');
    this.catNames =
        (args == null || args['cat_names'] == null) ? [] : args['cat_names'];
    this.drugsByCat = (args == null || args['drugs_by_cat'] == null)
        ? []
        : args['drugs_by_cat'];
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

  @override
  Widget build(BuildContext context) {
    print('build');
    args = ModalRoute.of(context).settings.arguments;
    init_page();
    print("Nav items length: ${navItems.length}");
    // var widgets = this.init.then((value) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        //leadingWidth: 5,
        title: Row(children: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 30,
            ),
            onPressed: () {
              navigateToProfile(context, _token);
            },
          ),
          Text(
            '${this.userName}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        //title: Text('Pharmacy App'),
        //centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          InkWell(
              child: Row(
                children: [
                  Icon(Icons.login_outlined),
                  SizedBox(width: 3),
                  Text("Logout"),
                  SizedBox(width: 12),
                ],
              ),
              onTap: () {
                logout(context);
              }),
        ],
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
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
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
                        color: Theme.of(context).primaryColor,
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
                          color: Theme.of(context).primaryColor,
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

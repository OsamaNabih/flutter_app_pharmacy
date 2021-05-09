import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/widgets/card_info.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'add_to-list_page.dart';
import 'order_details.dart';

class List_order extends StatefulWidget {
  @override
  _List_orderState createState() => _List_orderState();
}

class _List_orderState extends State<List_order> {
  final int selected = 2;

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => List_order()));
    }
    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Add_to_list()));
    }
    if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
              color: Colors.red,
              size: 30,
            ),
            Text(
              "Person Name",
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ])),
          cardInfoTemplate("22/4/2020", "99", true),
          cardInfoTemplate("23/4/2020", "77", true),
          cardInfoTemplate("27/4/2020", "554", true),
          cardInfoTemplate("26/9/2020", "54", false),
          cardInfoTemplate("26//2020", "56", false),
          cardInfoTemplate("2/5/2020", "45", true),
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
    );
  }

  void item(int r) {
    Widget k;
    for (int y = 0; y < r; y++) {
      Widget k = cardInfoTemplate("order date", "order price", true);
    }
  }
}

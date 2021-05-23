import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/Admin_orders.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/data/list_order.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/widgets/card_info.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'add_to-list_page.dart';
import 'order_details.dart';
import 'dart:convert'; import 'package:http/http.dart' as http;
class List_order extends StatefulWidget {
  @override
  _List_orderState createState() => _List_orderState();
}

class _List_orderState extends State<List_order> {
  final int selected = 2;
  var args;
  list_order list;





  void _onItemTapped(int index) {
    if (index == 2) {

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

    args = ModalRoute.of(context).settings.arguments;
    list=args["order_object"];

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
              args["user_name"],
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ])),

          //Hardcoded data
         /* cardInfoTemplate("22/4/2020", "99", "Approved"),
          cardInfoTemplate("23/4/2020", "77", "Approved"),
          cardInfoTemplate("27/4/2020", "554", "Delivered"),
          cardInfoTemplate("26/9/2020", "54", "Rejected"),
          cardInfoTemplate("26//2020", "56", "Shipping"),
          cardInfoTemplate("2/5/2020", "45", "Pending Approval"),
*/
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
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> item(List<order> ord) {
    List<Widget> cards=[];

 for (int y = 0; y < ord.length; y++) {
      cards.add(cardInfoTemplate(ord[y].order_date, "${ord[y].Total_Cost}", ord[y].order_status_name,ord[y].order_id));

    }
    return cards;
  }
}

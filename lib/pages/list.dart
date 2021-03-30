import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/widgets/card_info.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'order_details.dart';


class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  int selected=0;

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Pharmacy App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),

      body:ListView(
        children: [
          Center(
                child:Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_box,
                        color: Colors.red,
                        size: 30,
                      ),
                      Text(
                        "Person Name",
                        style: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold),
                      ),
                    ]
                )
          ),
          cardInfoTemplate("22/4/2020" , "99"),
          cardInfoTemplate("23/4/2020","77"),
          cardInfoTemplate("27/4/2020","554"),
          cardInfoTemplate("26/9/2020","54"),
          cardInfoTemplate("26//2020","56"),
          cardInfoTemplate("2/5/2020","45"),
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


  void item(int r){
    Widget k;
    for(int y=0 ; y<r ; y++){
      Widget k = cardInfoTemplate("order date", "order price");
    }
  }
}



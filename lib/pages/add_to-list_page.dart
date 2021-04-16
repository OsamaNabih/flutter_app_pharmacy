import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/widgets/card_info.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'list.dart';
import 'order_details.dart';

class Add_to_list extends StatefulWidget {
  @override
  _Add_to_listState createState() => _Add_to_listState();
}

class _Add_to_listState extends State<Add_to_list> {
  final int selected = 1;
  void _onItemTapped(int index) {

    if(index==2){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => List_order()));
    }
    if(index==1){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add_to_list()));
    }
    if(index==0){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"app",
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Pharmacy App'),
          backgroundColor:Colors.red,
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                alignment: Alignment.center,
                child: Text(
                  "Your Order",
                  style: TextStyle(fontSize: 30 , color: Colors.red ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*15/100,
                alignment: Alignment.centerRight,
                child:
                Container(
                  width: 80,
                  height: 30,
                  child: FloatingActionButton(
                      heroTag: '',
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        "Buy Order",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/order_details');
                        //MaterialPageRoute(builder: (context) => orderTemplate()),
                      }
                  ),
                ),
              ),
              list_row("ksksmks", "889"),
              Container(
                height: MediaQuery.of(context).size.height*5/100,
              ),
              list_row("ksksmks", "1"),
              Container(
                height: MediaQuery.of(context).size.height*5/100,
              ),
              list_row("ksksmks", "86"),
              Container(
                height: MediaQuery.of(context).size.height*5/100,
              ),
              list_row("ksksmks", "32"),
            ],
          ),

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
  }

  Container list_row(String name , String quantity ) {
    return
      Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child:
        Container(

          width: MediaQuery.of(context).size.width*80/100,
          decoration: BoxDecoration(

            border: Border.all(

            ),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.amber,

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Name :",
                        style: TextStyle(fontSize: 15 , color: Colors.red ),
                      ),
                      Text(
                        "${name}",
                        style: TextStyle(fontSize: 15 , color: Colors.black ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Quantity :",
                        style: TextStyle(fontSize: 15 , color: Colors.red ),
                      ),
                      Text(
                        "${quantity}",
                        style: TextStyle(fontSize: 15 , color: Colors.black ),
                      ),
                    ],
                  )
                ],
              ),

              Column(
                children: [

                      Container(
                        alignment: Alignment.centerRight,

                        child: Container(
                          width: 80,
                          height: 30,
                          child: FloatingActionButton(
                              heroTag: '',
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                "Delete",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              onPressed: () {
                                //Navigator.pushNamed(context, '/order_details');
                                //MaterialPageRoute(builder: (context) => orderTemplate()),
                              }
                          ),
                        ),
                      ),

                ],
              )
            ],
          ),
        ),
      )
    ;
  }
}

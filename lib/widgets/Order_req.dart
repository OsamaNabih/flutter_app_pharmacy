
import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';

class order_request extends StatelessWidget {
  final String date;
  final String price;
  final String name;

  order_request({ this.name,this.date, this.price });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Text("$name" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 25),),
            title: Text("$date" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
            subtitle: Text("$price", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
          ),

          Container(

              width: (MediaQuery.of(context).size.width/20)*100,
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    height: 30,
                    child: FloatingActionButton(
                        heroTag: '',
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Accept Order",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        onPressed: () {
                         // Navigator.pushNamed(context, '/order_details');
                          //MaterialPageRoute(builder: (context) => orderTemplate()),
                        }
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 30,
                    child: FloatingActionButton(
                        heroTag: '',
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Reject Order",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        onPressed: () {
                          //Navigator.pushNamed(context, '/order_details');
                          //MaterialPageRoute(builder: (context) => orderTemplate()),
                        }
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 30,
                    child: FloatingActionButton(
                        heroTag: '',
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "View Order Details",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        onPressed: () {
                          //Navigator.pushNamed(context, '/order_details');
                          //MaterialPageRoute(builder: (context) => orderTemplate()),
                        }
                    ),
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }
}


Widget orderInfoTemplate(String name,String date, String price){
  return order_request(name:name,date:date, price:price);
}


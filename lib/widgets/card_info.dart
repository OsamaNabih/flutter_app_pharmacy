
import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';

class CardInfo extends StatelessWidget {
  final String date;
  final String price;

  CardInfo({ this.date, this.price });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add_shopping_cart_sharp, size: 30),
            title: Text("$date" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
            subtitle: Text("$price", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
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
                    Navigator.pushNamed(context, '/order_details');
                      //MaterialPageRoute(builder: (context) => orderTemplate()),
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget cardInfoTemplate(String date, String price){
  return CardInfo(date:date, price:price);
}


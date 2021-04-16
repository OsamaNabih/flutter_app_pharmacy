
import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';

class CardInfo extends StatelessWidget {
  final String date;
  final String price;
  final bool flag;
  String status;

  Color color;

  CardInfo({ this.date, this.price , this.flag}){
   if(flag==true){
     status="Accept";
     color=Colors.green;
   }else{
     status="Reject";
     color=Colors.red;

   }

  }


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add_shopping_cart_sharp, size: 30),
            title: Text("$date" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
            subtitle: Text("$price", style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text(
                 "${status}",
                   style: TextStyle(color:color,fontWeight:FontWeight.bold,fontSize: 20)

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
                        Navigator.pushNamed(context, '/order_details');
                          //MaterialPageRoute(builder: (context) => orderTemplate()),
                      }
                  ),
                ),

             ],
           ),

        ],
      ),
    );
  }
}


Widget cardInfoTemplate(String date, String price, bool flag){
  return CardInfo(date:date, price:price , flag: flag,);
}


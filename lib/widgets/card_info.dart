import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';
import 'dart:convert'; import 'package:http/http.dart' as http;
import 'dart:convert';
class CardInfo extends StatelessWidget {
   String date;
   String price;
   bool flag;
  String status;
Function f;
  Color color;
   Item drug_list;
   int drug_id;



   Future GetDrugsData(int orderid) async{
     var response;
     print('getting orders data');
     var dataURI = Uri.http('10.0.2.2:3000', 'orders/${orderid}');
     print("Sending get orders request");
     response = await http.get(dataURI);
     print("res_orders");
     if (response.statusCode != 200) {
       throw ("Server error: ${response.body}");
     }
     final String responseString = response.body;
     Item list= Item.fromJson(json.decode(responseString));
     print("${list.drugs[0].drugName} pppppppp");
     this.drug_list=list;
     return Future(() {
       print('adfsdf');
     });
   }

  CardInfo({this.date, this.price, this.status,this.f,this.drug_id}) {
    if (status == "Approved" || status == "Delivered") {
      color = Colors.green;
    } else if(status == "Rejected") {
      color = Colors.red;
    } else if (status == "Pending Approval") {
      color = Colors.yellow;
    } else if (status == "Shipping"){
      color = Colors.brown;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    return Card(
      color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add_shopping_cart_sharp, size: 30),
            title: Text(
              "$date",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "$price",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${status}",
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.bold, fontSize: 20)),
              Container(
                width: 120,
                height: 30,
                child: FloatingActionButton(
                    heroTag: '',
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      "View Order Details",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    onPressed: () async {
                      await GetDrugsData(drug_id);
                      print(this.drug_list.runtimeType);
                      print(this.drug_list == null);
                      print("${this.drug_list.drugs[0]} ssss");


                      Navigator.pushNamed(context, '/order_details', arguments: {
                       'DrugObject':this.drug_list.drugs,
                        'user_name': args['user_name'],
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget cardInfoTemplate(String date, String price, String status,int id) {
  return CardInfo(
    date: date,
    price: price,
    status: status,

    drug_id: id,
  );
}

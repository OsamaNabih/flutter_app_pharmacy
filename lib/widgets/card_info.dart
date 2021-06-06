import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardInfo extends StatelessWidget {
  String datetime;
  String price;
  bool flag;
  String status;
  Function f;
  Color color;
  Item drug_list;
  int drug_id;
  String _date;

  CardInfo({this.datetime, this.price, this.status, this.f, this.drug_id}) {
    if (status == "Approved" || status == "Delivered") {
      color = Colors.green;
    } else if (status == "Rejected") {
      color = Colors.red;
    } else if (status == "Pending Approval") {
      color = Colors.yellow;
    } else if (status == "Shipping") {
      color = Colors.brown;
    }
    List<String> splitDateTime = datetime.split('T');
    _date = splitDateTime[0];
    //String time = splitDateTime[1];
    //List<String> splitDate = date.split('-');
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
              "$_date",
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
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.46,
                child: Text("${status}",
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.46,
                height: 30,
                child: FloatingActionButton(
                    heroTag: '',
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Icon(Icons.info),
                    onPressed: () async {
                      this.drug_list = await GetDrugsData(drug_id);
                      print(this.drug_list.runtimeType);
                      print(this.drug_list == null);
                      print("${this.drug_list.drugs[0]} ssss");

                      Navigator.pushNamed(context, '/order_details',
                          arguments: {
                            'DrugObject': this.drug_list.drugs,
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

Future<Item> GetDrugsData(int orderid) async {
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
  Item list = Item.fromJson(json.decode(responseString));
  print("${list.drugs[0].drugName} pppppppp");
  return list;
}

Widget cardInfoTemplate(String datetime, String price, String status, int id) {
  return CardInfo(
    datetime: datetime,
    price: price,
    status: status,
    drug_id: id,
  );
}

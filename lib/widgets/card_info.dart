import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../data/drugs_by_cat.dart';
import '../services/card_info.dart';

class CardInfo extends StatelessWidget {
  String datetime;
  String price;
  bool flag;
  String status;
  Function f;
  Color color;
  Item _drugList;
  int drugId;
  String _date;
  DateTime _datetime;

  CardInfo({this.datetime, this.price, this.status, this.f, this.drugId}) {
    if (status == "Approved" || status == "Delivered") {
      color = Colors.green;
    } else if (status == "Rejected") {
      color = Colors.red;
    } else if (status == "Pending") {
      color = Colors.yellow[700];
    } else if (status == "Shipping") {
      color = Colors.brown;
    }
    List<String> splitDateTime = datetime.split('T');
    _date = splitDateTime[0];
    _datetime = DateTime.parse(_date);
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    return InkWell(
        child: Card(
          //color: Colors.amber,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.add_shopping_cart_sharp,
                    size: 30, color: Colors.grey[600]),
                title: Text(
                  "${DateFormat.yMMMMEEEEd().format(_datetime)}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "$price EGP",
                  style: TextStyle(
                      color: Colors.orange[800], fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${status}",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    /*
                    SizedBox(width: 8.0),
                    Icon(Icons.arrow_forward_ios_sharp, size: 15),
                     */
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () async {
          _drugList = await getDrugsData(drugId);
          navigateToOrder(context, _drugList, this.drugId, args['user_name']);
        });
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../pages/order_details.dart';
import '../data/drugs_by_cat.dart';
import '../widgets/card_info.dart';

Future<Item> getDrugsData(int orderid) async {
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
  print("${list.drugs[0].drugName}");
  return list;
}

Widget cardInfoTemplate(String datetime, String price, String status, int id) {
  return CardInfo(
    datetime: datetime,
    price: price,
    status: status,
    drugId: id,
  );
}


Future <void> navigateToOrder(BuildContext context, Item drugList, int drugId, String userName) async {
  Navigator.pushNamed(context, '/order_details',
      arguments: {
        'DrugObject': drugList.drugs,
        'user_name': userName,
      });
}
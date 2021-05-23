import 'dart:convert';

import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';

class list_order{
  list_order({this.orders});
  List<order>orders;
  factory list_order.fromJson(Map<String, dynamic> json) => list_order(
    orders:List<order>.from(json["orders"].map((x) => order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
  int getlen(){
    return orders.length;
  }


}
class order {
  order({
    this.user_id,
    this.order_id,
    this.user_name,
    this.order_date,
    this.order_status_name,
    this.Total_Cost,
    this.order_note,
  });
  int user_id;
  String user_name;
  int order_id;
  String order_status_name;
  String order_date;
  int Total_Cost;
  String order_note;


  factory order.fromJson(Map<String, dynamic> json) => order(
    user_id:json["user_id"],
    order_id:json["order_id"],
    user_name:json["user_name"],
    order_date:json["order_date"],
    order_status_name:json["order_status_name"],
    Total_Cost:json["Total Cost"],
    order_note:json["order_note"],
  );

  Map <String, dynamic> toJson() => {
    "user_id": user_id,
    "order_id": order_id,
    "user_name": user_name,
    "order_date": order_date,
    "order_status_name": order_status_name,
    "Total Cost": Total_Cost,
    "order_note": order_note,
  };
}

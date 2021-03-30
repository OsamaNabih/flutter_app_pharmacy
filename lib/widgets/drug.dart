import 'package:flutter/material.dart';

Widget drugTemplate(String name,String price){
  return Container(
    width: 120,
    height: 95,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      /*
      border: Border(
        top: BorderSide(width: 3.0, color: Colors.black),
        bottom: BorderSide(width: 3.0, color: Colors.black),
      ),
      */

      color: Colors.deepOrange,
    ),

    child: Center(
      child: Text(
      "Name : ${name}",
        //"Price : ${price}",
        style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),

      ),
    ),
  );
}
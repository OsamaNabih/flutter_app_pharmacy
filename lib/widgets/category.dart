import 'package:flutter/material.dart';

Widget category (String name, Function onTapFunc){
  return InkWell(

    child: Container(
      width: 70,
      height: 45,

      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 3.0, color: Colors.white),
          bottom: BorderSide(width: 3.0, color: Colors.white),
        ),
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          "${name}",
          style: TextStyle(fontSize: 10 , color: Colors.white , fontWeight: FontWeight.bold),
        ),
      ),
    ),

    onTap: onTapFunc(name),

  );
}
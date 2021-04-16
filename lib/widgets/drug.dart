import 'package:flutter/material.dart';

Widget drugTemplate(String name,String price){
  return Card(
    color: Colors.amber,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ListTile(
          leading:
             CircleAvatar(
                child: Image.asset('images/image1.jpg'),
                radius: 30,
             ),
          title: Text("${name}" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
          subtitle: Text("Price :$price" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 70,
              height: 40,
              child: TextField(
                decoration: new InputDecoration(labelText: "Enter quantity", labelStyle: TextStyle(color:Colors.red, fontSize: 15)),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              width: 120,
              height: 30,
              child: FloatingActionButton(
                  heroTag: '',
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    "Add to list",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
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
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    "drug description",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/order_details');
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
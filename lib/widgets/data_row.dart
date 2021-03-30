import 'package:flutter/material.dart';

Widget dataRowTemplate({String item, String qun, String price}) {
  return DataRow(item:item, qun:qun, price:price);
}

class DataRow extends StatelessWidget{
  final String item;
  final String qun;
  final String price;

  DataRow({this.item, this.qun, this.price});

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height*10/100,
        width: MediaQuery.of(context).size.width*80/100,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${item}",
            style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
          ),
          Text(
            "${qun}",
            style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
          ),
          Text(
            "${price}",
            style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height*0.5/100,
        width: MediaQuery.of(context).size.width*80/100,
      ),
    ]                    ,
  );
}
}

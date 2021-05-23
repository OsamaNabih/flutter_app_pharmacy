import 'package:flutter/material.dart';

Widget dataRowTemplate({@required String item, @required int quantity, @required int price}) {
  return DataRow(item:item, quantity:quantity, price:price);
}

class DataRow extends StatelessWidget{
  final String item;
  final int quantity;
  final int price;

  DataRow({this.item, this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height*5/100,
        width: MediaQuery.of(context).size.width*80/100,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.265,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange])
            ),
            child: Center(
              child: Text(
                "${item}",
                style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.265,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange])
            ),
            child: Center(
              child: Text(
                "${quantity}",
                style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.265,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange])
            ),
            child: Center(
              child: Text(
                "${price}",
                style: TextStyle(fontSize: 20 , color: Colors.black , fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      Container(
        height: 5,
      ),
    ] ,
  );
}
}

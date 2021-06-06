import 'package:flutter/material.dart';

Widget dataRowTemplate(
    {@required String item, @required int quantity, @required int price}) {
  return DataRow(item_name: item, quantity: quantity, price: price);
}

class DataRow extends StatelessWidget {
  final String item_name;
  final int quantity;
  final int price;

  DataRow({this.item_name, this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 5 / 100,
          width: MediaQuery.of(context).size.width * 80 / 100,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 60 / 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              Container(
                child: Center(
                  child: Text(this.item_name,
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Quantity : ${this.quantity}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(" Unit Price : ${this.price}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Container(
                height: 5,
              ),
              Container(
                child: Center(
                  child: Text(" Total Cost : ${this.price * this.quantity}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 5,
        ),
      ],
    );
  }
}

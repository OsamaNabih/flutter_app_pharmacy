import 'package:flutter/material.dart';

import '../data/drug_data_admin.dart';

class DrugInventory extends StatelessWidget {
  Drug drug;

  DrugInventory({this.drug});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5,
        ),
        Center(
          child: Text(
            drug.drugName,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.italic,
                fontSize: 18),
          ),
        ),
        Container(
          height: 8,
        ),
        Row(
          children: [
            Text(
              "Quantity : ",
              style: TextStyle(fontSize: 15, color: Colors.yellowAccent),
            ),
            Text(
              "${drug.drugQuantity}",
              style: TextStyle(fontSize: 13, color: Colors.black),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Company: ",
              style: TextStyle(fontSize: 15, color: Colors.yellowAccent),
            ),
            Text(
              "${drug.drugCompany}",
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
        Row(
          children: [
            Text("Price : ",
                style: TextStyle(fontSize: 15, color: Colors.yellowAccent)),
            Text("${drug.drugPrice}",
                style: TextStyle(fontSize: 13, color: Colors.black)),
          ],
        ),
        Row(
          children: [
            Text("Category: ",
                style: TextStyle(fontSize: 15, color: Colors.yellowAccent)),
            Text("${drug.category}",
                style: TextStyle(fontSize: 13, color: Colors.black)),
          ],
        ),
      ],
    );
  }
}

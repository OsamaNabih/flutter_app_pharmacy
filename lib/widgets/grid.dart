import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';

class Grid extends StatefulWidget {
  List<Drug> drugs = [];

  Grid(List<Drug> drugs) {
    this.drugs = drugs;
  }

  @override
  _GridState createState() => _GridState(this.drugs);
}

class _GridState extends State<Grid> {

  List<Drug> drugs = [];

  _GridState(List<Drug> drugs) {
    print('Inside grid');
    this.drugs = drugs;
  }

  List<Widget> _getDrugs() {
    List<Widget> drugWidgets = [];
    print('get drugs');
    //print(drugs);
    drugs.forEach((drug) {
      drugWidgets.add(drugTemplate(drug.drugName, drug.drugPrice.toString()));
    });
    //drugs.map((drug) => drugWidgets.add(drugTemplate(drug.drugName, drug.drugPrice.toString())));
    //print(drugWidgets);
    return drugWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(


        // Generate 100 widgets that display their index in the List.
        children: _getDrugs(),
      ),
    );
  }
}

Widget gridTemplate(List<Drug> drugs) {
  return Grid(drugs);
}
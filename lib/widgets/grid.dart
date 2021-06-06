import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';

/*
class Grid extends StatefulWidget {
  List<Drug> drugs = [];
  Function showDialog;

  Grid(List<Drug> drugs, Function showDialog) {
    this.drugs = drugs;
    this.showDialog = showDialog;
  }

  @override
  _GridState createState() => _GridState(this.drugs, showDialog);
}

class _GridState extends State<Grid> {

  List<Drug> drugs = [];
  Function showDialog;

  _GridState(List<Drug> drugs, Function showDialog) {
    print('Inside grid');
    this.drugs = drugs;
    this.showDialog = showDialog;
  }

  List<Widget> _getDrugs() {
    List<Widget> drugWidgets = [];
    print('get drugs');
    //print(drugs);
    drugs.forEach((drug) {
      drugWidgets.add(drugTemplate(drug.drugName, drug.drugPrice, drug.drugDescription, showDialog));
      //print(drug.drugName);
    });
   // drugs.map((drug) => drugWidgets.add(drugTemplate(drug, showDialog)));
    //print(drugWidgets);
    return drugWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        // Generate 100 widgets that display their index in the List.
        children: _getDrugs(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      );
  }
}
*/

List<Widget> gridTemplate(List<Drug> drugs, Function showDialog) {
  //return Grid(drugs, showDialog);
  return getDrugs(drugs, showDialog);
}

List<Widget> getDrugs(List<Drug> drugs, Function showDialog) {
  List<Widget> drugWidgets = [];
  print('get drugs');
  //print(drugs);
  drugs.forEach((drug) {
    drugWidgets.add(drugTemplate(drug.drugId, drug.drugName, drug.drugPrice,
        drug.drugDescription, showDialog));
    //print(drug.drugName);
  });
  // drugs.map((drug) => drugWidgets.add(drugTemplate(drug, showDialog)));
  //print(drugWidgets);
  return drugWidgets;
}

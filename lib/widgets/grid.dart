import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';

List<Widget> gridTemplate(List<Drug> drugs, Function showDialog) {
  //return Grid(drugs, showDialog);
  return getDrugs(drugs, showDialog);
}

List<Widget> getDrugs(List<Drug> drugs, Function showDialog) {
  List<Widget> drugWidgets = [];
  print('get drugs');
  //print(drugs);
  drugs.forEach((drug) {
    drugWidgets.add(DrugRow(drug: drug, showDialog: showDialog));
    //print(drug.drugName);
  });
  // drugs.map((drug) => drugWidgets.add(drugTemplate(drug, showDialog)));
  //print(drugWidgets);
  return drugWidgets;
}

Widget getDrug(Drug drug, Function showDialog) {
  return DrugRow(drug: drug, showDialog: showDialog);
}

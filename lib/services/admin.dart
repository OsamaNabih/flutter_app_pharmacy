// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_app_pharmacy/widgets/drug_inventory.dart';

// import '../data/drug_data_admin.dart';
// import '../pages/admin.dart';


// List<Drug> searchResult(String word, All_Drugs drugList) {
//     print(word);
//     List<Drug> drugs = [];
//     for (int y = 0; y < drugList.drugs.length; y++) {
//       if (drugList.drugs[y].drugName.contains(word)) {
//         drugs.add(drugList.drugs[y]);
//       }
//     }
//     print(drugs[0].drugName);
//     return drugs;
//   }

// List<Container> getRowData(List<Drug> list) {
//     List<Container> rows = [];
//     rows.clear();
//     rows.add(getSearchBar());
//     rows.add(Container(
//       height: 10,
//     ));

//     for (int p = 0; p < list.length; p++) {
//       rows.add(Container(
//         child: Container(
//           child: Center(
//               child: Container(
//             width: MediaQuery.of(context).size.width * 0.85,
//             decoration: BoxDecoration(
//               color: Colors.redAccent,
//               border: Border.all(width: 2.0),
//               borderRadius: BorderRadius.all(Radius.circular(15.0) //
//                   ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 6.0),
//               child: DrugInventory(drug: list[p]),
//             ),
//           )),
//         ),
//       ));
//       rows.add(Container(
//         height: 10,
//       ));
//     }
//     return rows;
//   }
// import 'package:flutter/material.dart';
// import 'package:flutter_app_pharmacy/data/drug_data_admin.dart' as Admin;
// import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
// import 'package:flutter_app_pharmacy/widgets/data_row.dart' as DrugDataRow;

// class Order_D extends StatefulWidget {
//   @override
//   _Order_DState createState() => _Order_DState();
// }

// class _Order_DState extends State<Order_D> {
//   int selected = 2;
//   int total_price = 0;
//   var args;
//   Item list_of_drug;
//   String user_name;
//   List<Admin.Drug> drugs = [];
//   void _onItemTapped(int index) {
//     setState(() {
//       selected = index;
//     });
//   }

//   List<DrugDataRow.DataRow> getDrugDataRows() {
//     print('Quantity: ${drugs[0].drugQuantity}');
//     return List<DrugDataRow.DataRow>.from(drugs.map((drug) {
//       this.total_price =
//           this.total_price + (drug.drugPrice * drug.drugQuantity);
//       return dataRowTemplate(
//           item: drug.drugName,
//           quantity: drug.drugQuantity,
//           price: drug.drugPrice);
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     args = ModalRoute.of(context).settings.arguments;

//     drugs = args['DrugObject'];
//     user_name = args['user_name'];

//     print(drugs[0].drugName);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Text(
//           "Pharmacy App",
//           style: TextStyle(
//               fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Row(children: <Widget>[
//               Icon(
//                 Icons.account_box,
//                 color: Theme.of(context).primaryColor,
//                 size: 30,
//               ),
//               Text(
//                 user_name,
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Theme.of(context).primaryColor,
//                     fontWeight: FontWeight.bold),
//               ),
//             ]),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 100,
//               child: Center(
//                 child: Text(
//                   "Order_Details",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Theme.of(context).primaryColor,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 50 / 100,
//               width: MediaQuery.of(context).size.width * 80 / 100,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.redAccent,
//                 ),
//               ),
//               child: ListView(
//                 children: <Widget>[
//                   ...getDrugDataRows(),
//                 ],
//               ),
//             ),
//             Container(
//               height: 30,
//               child: Center(
//                 child: Text(
//                   " Total Cost ",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Theme.of(context).primaryColor,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               height: 20,
//               child: Center(
//                 child: Text(
//                   "${this.total_price}",
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget orderTemplate() {
//   return Order_D();
// }

import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
void main(){
  runApp(
    MaterialApp(home:Admin())
  );
}
class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}
class _AdminState extends State<Admin> {
  Map mymap= {
    '': {
      '': ['', '', ''],
    },
    '': {
      '': ['', '', ''],
    },
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Pharmacy App",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,

          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.inventory),text: "Inventory",),
              Tab(icon: Icon(Icons.add_shopping_cart),text: "Orders"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.red,
                      style: BorderStyle.solid,
                      width: 2),
                    children: [
                TableRow( children: [
                Column(children:[Text('Drug_name', style: TextStyle(fontSize: 20.0))]),
                  Column(children:[Text('Quantity', style: TextStyle(fontSize: 20.0))]),
                 Column(children:[Text('Category', style: TextStyle(fontSize: 20.0))]),
          ]),]

      ),
                Table(
                defaultColumnWidth: FixedColumnWidth(120.0),
        border: TableBorder.all(
                color: Colors.red,
                style: BorderStyle.solid,
                width: 2),
        children:getrowdata(mymap),
      ),
              ],
            ),
            ListView(
              children: [
                orderInfoTemplate("moamen","22/4/2020" , "99",""),
                orderInfoTemplate("osama","22/4/2020" , "100",""),
                orderInfoTemplate("moame4n","22/4/2020" , "444","rej"),
                orderInfoTemplate("moam433en","22/4/2020" , "9459","com"),
                orderInfoTemplate("moa34men","22/4/2020" , "939","com"),
                orderInfoTemplate("osama","22/4/2020" , "100",""),
                orderInfoTemplate("osama","22/4/2020" , "100","rej"),
              ],
            ),
          ],
        ),
      ),
    );

  }

  List<TableRow> getrowdata(Map <dynamic,dynamic> map){
    List<TableRow> row= [];

    for(int p=0 ; p<map.length ; p++){


      row.add(TableRow( children: [
        Column(children:[Text("index 1")]),
        Column(children:[Text('index 2')]),
        Column(children:[Text('index 3')]),
      ]));
    }
    return row;
  }
}

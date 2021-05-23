import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/Admin_orders.dart';
import 'package:flutter_app_pharmacy/pages/order_nav.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'package:flutter_app_pharmacy/data/drug_data_admin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MaterialApp(home: Admin()));
}

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TabController _tabController;
  int _selectedDestination = 0;
  All_Drugs list_drug;
  All_orders list_orders;
   _AdminState(){
    getdrug_data();
    getorders_data();
  }
  void getdrug_data()async{
    var response;
    print('getting drug data');
    var dataURI = Uri.http('10.0.2.2:3000', 'drugs');
    print("Sending get drugs request");
    response = await http.get(dataURI);
    print("res_drug");
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    final String responseString = response.body;
    All_Drugs list= All_Drugs.fromJson(json.decode(responseString));
    print("drugs len ===${list.getlen()}");
    print("${list.drugs[0].drugName}");
    this.list_drug=list;

  }

  void getorders_data()async{
    var response;
    print('getting orders data');
    var dataURI = Uri.http('10.0.2.2:3000', 'orders');
    print("Sending get orders request");
    response = await http.get(dataURI);
    print("res_orders");
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    final String responseString = response.body;
    All_orders list= All_orders.fromJson(json.decode(responseString));
    print("orders len ===${list.getlen()}");
    print("${list.orders[0].orderStatusName}");
    this.list_orders=list;
    order_state();

  }

  void order_state(){
     for(int p=0; p< list_orders.orders.length ; p++){
       if(list_orders.orders[p].orderStatusName=="Approved"){
         this.Accept.add( orderInfoTemplate("moamen", list_orders.orders[p].orderDate,"90" , ""));
       }
       if(list_orders.orders[p].orderStatusName=="Pending Approval"){
         this.not_reply.add( orderInfoTemplate("moamen", list_orders.orders[p].orderDate,"90" , ""));
       }
       if(list_orders.orders[p].orderStatusName=="Rejected"){
         this.Reject.add( orderInfoTemplate("moamen", list_orders.orders[p].orderDate,"90" , ""));
       }
     }
  }
  List<Widget> not_reply = [

  ];
  List<Widget> Accept = [

  ];
  List<Widget> Reject = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Pharmacy App",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.inventory),
                text: "Inventory",
              ),
              Tab(icon: Icon(Icons.add_shopping_cart), text: "Orders"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: getrowdata(list_drug.drugs),
            ),
            order_nav(not_reply, Accept, Reject),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  List<Container> getrowdata( List<drug> list) {
    List<Container> row = [];
    row.add(Container(
      alignment: Alignment.centerRight,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by Drug Name',
                    hintStyle: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.red,
                size: 20,
              ),
              Container(
                height: 30,
                child: FloatingActionButton(
                    heroTag: '',
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0))),
                    child: Text(
                      "search",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, '/order_details');
                      //MaterialPageRoute(builder: (context) => orderTemplate()),
                    }),
              )
            ],
          )),
    ));
    row.add(Container(
      height: 10,
    ));
    row.add(Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Center(
              child: Text(
                "Drug_Name",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Center(
              child: Text(
                "Quantity",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Center(
              child: Text(
                "Category",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    ));
    for (int p = 0; p < list.length; p++) {
      row.add(Container(
        child: Container(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Table(

                border: TableBorder.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2),
                children: [

                  TableRow( children: [

                    Container(
                        decoration: BoxDecoration(
                            gradient:
                            LinearGradient(colors: [Colors.red, Colors.orange])),

                        child: Column(children:[Text(list[p].drugName, style: TextStyle(fontSize: 20.0))])
                    ),
                    Container(
                        decoration: BoxDecoration(
                            gradient:
                            LinearGradient(colors: [Colors.red, Colors.orange])),
                        child: Column(children:[Text("${list[p].drugQuantity}", style: TextStyle(fontSize: 20.0))])
                    ),
                    Container(
                        decoration: BoxDecoration(
                            gradient:
                            LinearGradient(colors: [Colors.red, Colors.orange])),
                        child: Column(children:[Text(list[p].categoryName, style: TextStyle(fontSize: 20.0))])
                    ),

                ],
              ),
      ]),
            )

            /*child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange])),
                  child: Center(

                    child: Text(
                      list[p].drugName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange])),
                  child: Center(
                    child: Text(
                      "${list[p].drugPrice}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange])),
                  child: Center(
                    child: Text(
                      list[p].categoryName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),*/
          ),
        ),
      ));
      row.add(Container(
        height: 30,
      ));
    }
    return row;
  }
}

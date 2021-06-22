import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/Admin_orders.dart';
import '../data/orders.dart';
import '../pages/order_nav.dart';
import '../widgets/Order_req.dart';
import '../data/drug_data_admin.dart';
import '../services/home.dart';
import '../services/admin.dart';

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
  All_Drugs drugList;
  All_orders order_list;
  List<Drug> drugs = [];
  Map args = {};
  Function view;
  TextEditingController searchWordController = new TextEditingController();
  ListView p;
  List<Container> row = [];

  void orderState() {
    if (Accept.length > 0 || Reject.length > 0 || not_reply.length > 0) return;

    for (int p = 0; p < order_list.orders.length; p++) {
      order_admin order = order_list.orders[p];
      Widget orderWidget = orderInfoTemplate(
          id: order.orderId,
          name: order.userName,
          datetime: order.orderDate,
          price: order.orderPrice,
          status: order.orderStatusName);
      if (order.orderStatusName == "Approved") {
        this.Accept.add(orderWidget);
      }
      if (order.orderStatusName == "Pending") {
        this.not_reply.add(orderWidget);
      }
      if (order.orderStatusName == "Rejected") {
        this.Reject.add(orderWidget);
      }
    }
  }

  List<Widget> not_reply = [];
  List<Widget> Accept = [];
  List<Widget> Reject = [];

  void init() async {
    print('Inside init');
    args = ModalRoute.of(context).settings.arguments;
    //this.drugList = args['inventory_list'];
    //this.order_list = args['order_list'];
    //this.drugs = this.drugList.drugs;

    print('Before order');
    
    //this.row = getRowData(this.drugs);

    var dataURI = Uri.http('10.0.2.2:3000', 'drugs');
    var response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    String responseString = response.body;

    All_Drugs drugList = All_Drugs.fromJson(json.decode(responseString));

    // Get user orders info
    dataURI = Uri.http('10.0.2.2:3000', 'orders');
    response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    responseString = response.body;
    All_orders order_list = All_orders.fromJson(json.decode(responseString));

    this.drugList = drugList;
    this.order_list = order_list;
    this.drugs = this.drugList.drugs;
    await orderState();
    setState(() {
          print('rebuilding');
        });
  }


  Widget getSearchBar() {
    return (Container(
      alignment: Alignment.centerRight,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  controller: searchWordController,
                  decoration: InputDecoration(
                    hintText: 'Search by Drug Name',
                    hintStyle: TextStyle(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Container(
                height: 30,
                child: FloatingActionButton(
                    heroTag: '',
                    backgroundColor: Theme.of(context).primaryColor,
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
                      setState(() {
                        //this.drugs = searchResult(searchWordController.text, this.drugList);
                        //this.row = getRowData(this.drugs);
                        //print(this.row.length);
                        print(this.drugs[0].drugName);
                      });
                    }),
              )
            ],
          )),
    ));
  }


  @override
  void didChangeDependencies() {
    print('Before');
    super.didChangeDependencies();
    print('After');
    init();
  }

  @override
  Widget build(BuildContext context) {
    // initState();
    print('Inside build');
    //view(this.drugs);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Pharmacy App",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            InkWell(
                child: Row(
                  children: [
                    Icon(Icons.login_outlined),
                    SizedBox(width: 3),
                    Text("Logout"),
                    SizedBox(width: 12),
                  ],
                ),
                onTap: () {
                  logout(context);
                }),
          ],
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
              //children: getRowData(this.drugs),
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

}

import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/Admin_orders.dart';
import 'package:flutter_app_pharmacy/data/orders.dart';
import 'package:flutter_app_pharmacy/pages/order_nav.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';
import 'package:flutter_app_pharmacy/data/drug_data_admin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app_pharmacy/services/home.dart';

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
  All_Drugs drug_list;
  All_orders order_list;
  List<drug> drugs = [];
  Map args = {};
  Function view;
  TextEditingController SearchWord = new TextEditingController();
  ListView p;
  List<Container> row = [];

  List<drug> Search_Result(String word) {
    print(word);
    List<drug> drugs = [];
    for (int y = 0; y < this.drug_list.drugs.length; y++) {
      if (this.drug_list.drugs[y].drugName.contains(word)) {
        drugs.add(drug_list.drugs[y]);
      }
    }
    print(drugs[0].drugName);
    return drugs;
  }

  void order_state() {
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
      if (order.orderStatusName == "Pending Approval") {
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
    //this.drug_list = args['inventory_list'];
    //this.order_list = args['order_list'];
    //this.drugs = this.drug_list.drugs;

    print('Before order');
    
    //this.row = getrowdata(this.drugs);

    var dataURI = Uri.http('10.0.2.2:3000', 'drugs');
    var response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    String responseString = response.body;

    All_Drugs drug_list = All_Drugs.fromJson(json.decode(responseString));

    // Get user orders info
    dataURI = Uri.http('10.0.2.2:3000', 'orders');
    response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    responseString = response.body;
    All_orders order_list = All_orders.fromJson(json.decode(responseString));

    this.drug_list = drug_list;
    this.order_list = order_list;
    this.drugs = this.drug_list.drugs;
    await order_state();
    setState(() {
          print('rebuilding');
        });
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
              children: getrowdata(this.drugs),
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

  List<Container> listview(List<drug> list) {}

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
                  controller: SearchWord,
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
                        this.drugs = Search_Result(SearchWord.text);
                        //this.row = getrowdata(this.drugs);
                        //print(this.row.length);
                        print(this.drugs[0].drugName);
                      });
                    }),
              )
            ],
          )),
    ));
  }

  List<Container> getrowdata(List<drug> list) {
    List<Container> rows = [];
    rows.clear();
    rows.add(getSearchBar());
    rows.add(Container(
      height: 10,
    ));

    for (int p = 0; p < list.length; p++) {
      rows.add(Container(
        child: Container(
          child: Center(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0) //
                  ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 6.0),
              child: Column(
                children: [
                  Container(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      list[p].drugName,
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
                        style:
                            TextStyle(fontSize: 15, color: Colors.yellowAccent),
                      ),
                      Text(
                        "${list[p].drugQuantity}",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Company Name : ",
                        style:
                            TextStyle(fontSize: 15, color: Colors.yellowAccent),
                      ),
                      Text(
                        "${list[p].drugCompanyName}",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price : ",
                          style: TextStyle(
                              fontSize: 15, color: Colors.yellowAccent)),
                      Text("${list[p].drugPrice}",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Category Name: ",
                          style: TextStyle(
                              fontSize: 15, color: Colors.yellowAccent)),
                      Text("${list[p].categoryName}",
                          style: TextStyle(fontSize: 13, color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ),
      ));
      rows.add(Container(
        height: 10,
      ));
    }
    return rows;
  }
}

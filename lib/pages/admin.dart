import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/order_nav.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';

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
  List<Widget> not_reply = [
    orderInfoTemplate("moamen", "22/4/2020", "99", ""),
    orderInfoTemplate("osama", "22/4/2020", "100", ""),
    orderInfoTemplate("osama", "22/4/2020", "100", "")
  ];
  List<Widget> Accept = [
    orderInfoTemplate("moa34men", "22/4/2020", "939", "com"),
    orderInfoTemplate("moam433en", "22/4/2020", "9459", "com")
  ];
  List<Widget> Reject = [orderInfoTemplate("osama", "22/4/2020", "100", "rej")];
  Map mymap = {
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
              children: getrowdata(mymap),
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

  List<Container> getrowdata(Map<dynamic, dynamic> map) {
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
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Center(
              child: Text(
                "Quantity",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Center(
              child: Text(
                "Category",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    ));
    for (int p = 0; p < 3; p++) {
      row.add(Container(
        child: Container(
          child: Center(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.orange])),
                  child: Center(
                    child: Text(
                      "index1",
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
                      "index2",
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
                      "index3",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
      row.add(Container(
        height: 10,
      ));
    }
    return row;
  }
}

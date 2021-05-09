import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/widgets/data_row.dart';

class Order_D extends StatefulWidget {
  @override
  _Order_DState createState() => _Order_DState();
}

class _Order_DState extends State<Order_D> {
  int selected = 0;

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Pharmacy App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(
                Icons.account_box,
                color: Colors.red,
                size: 30,
              ),
              Text(
                "Person Name",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: Text(
                  "Order_Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 50 / 100,
              width: MediaQuery.of(context).size.width * 80 / 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Order_item",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.confirmation_num_sharp,
                            size: 20,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.money,
                            size: 20,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  dataRowTemplate(item: "item1", qun: "9", price: "180"),
                  dataRowTemplate(item: "item2", qun: "9", price: "180"),
                  dataRowTemplate(item: "item3", qun: "9", price: "180"),
                  dataRowTemplate(item: "item4", qun: "9", price: "180"),
                  dataRowTemplate(item: "item5", qun: "9", price: "180"),
                  dataRowTemplate(item: "item6", qun: "9", price: "180"),
                  dataRowTemplate(item: "item7", qun: "9", price: "180"),
                  dataRowTemplate(item: "item8", qun: "9", price: "180"),
                  dataRowTemplate(item: "item9", qun: "9", price: "180"),
                  dataRowTemplate(item: "item10", qun: "9", price: "180"),
                  dataRowTemplate(item: "item11", qun: "9", price: "180"),
                  dataRowTemplate(item: "item12", qun: "9", price: "180"),
                  dataRowTemplate(item: "item13", qun: "9", price: "180"),
                  dataRowTemplate(item: "item14", qun: "9", price: "180"),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Selected drugs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'History',
          ),
        ],
        currentIndex: selected,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget orderTemplate() {
  return Order_D();
}

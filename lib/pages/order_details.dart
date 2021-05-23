import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/widgets/data_row.dart';
import 'package:flutter_app_pharmacy/widgets/data_row.dart' as DrugDataRow;

class Order_D extends StatefulWidget {
  @override
  _Order_DState createState() => _Order_DState();
}

class _Order_DState extends State<Order_D> {
  int selected = 2;
  var args;
  Item list_of_drug;
  String user_name;
  List<Drug> drugs=[];
  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  List<DrugDataRow.DataRow> getDrugDataRows() {
    print('Quantity: ${drugs[0].drugQuantity}');
    return List<DrugDataRow.DataRow>.from(drugs.map((drug) => dataRowTemplate(item: drug.drugName, quantity: drug.drugQuantity, price: drug.drugPrice)));
  }

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments;

    drugs=args['DrugObject'];
    user_name = args['user_name'];

    print(drugs[0].drugName);

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
                user_name,
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
                  ...getDrugDataRows(),
                  //dataRowTemplate(item: "item1", qun: "9", price: "180"),
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


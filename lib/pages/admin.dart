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
  int selected=0;
  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }
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
            Text(
              "inv here"
            ),
            ListView(
              children: [

                orderInfoTemplate("moamen","22/4/2020" , "99"),
                orderInfoTemplate("osama","22/4/2020" , "100"),
                orderInfoTemplate("moame4n","22/4/2020" , "444"),
                orderInfoTemplate("moam433en","22/4/2020" , "9459"),
                orderInfoTemplate("moa34men","22/4/2020" , "939"),
              ],
            ),


          ],
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
      ),

    );


  }
}

import 'package:flutter/material.dart';

import '../data/list_order.dart';
import '../responses/user_login_response.dart';
import '../services/card_info.dart';
import '../widgets/card_info.dart';
import '../services/home.dart';
import '../pages/home.dart';

import '../services/login.dart';

class List_order extends StatefulWidget {
  @override
  _List_orderState createState() => _List_orderState();
}

class _List_orderState extends State<List_order> {
  int selected = 2;
  var args;
  list_order list;
  UserLoginResponse _user;
  AppBar appBar;

  void profileNavigationHandler() {
    navigateToProfile(context, _user.token);
  }

  void init() {
    this._user = UserLoginResponse(
      userName: args['user_name'],
      userType: args['user_type'],
      token: args['user_token'],
      userId: args['user_id'],
    );
    appBar = setAppBar(context, profileNavigationHandler, _user.userName);
  }

  void _onItemTapped(int index) {
    if (index == selected) return;
    setState(() {
      selected = index;
    });
    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/add_to_list_page', arguments: {
        'user_name': _user.userName,
        'user_type': _user.userType,
        'user_token': _user.token,
        'user_id': _user.userId,
      });
    } else if (index == 0) {
      navigateToHome(
          context,
          _user);
    }
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    list = args["order_object"];
    init();

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: [
          ...item(list.orders),
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
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> item(List<order> order) {
    List<Widget> cards = [];

    for (int y = 0; y < order.length; y++) {
      cards.add(CardInfo(datetime: order[y].order_date, 
      price: "${order[y].Total_Cost}",
      status: order[y].order_status_name, 
      drugId: order[y].order_id));
    }
    return cards;
  }
}

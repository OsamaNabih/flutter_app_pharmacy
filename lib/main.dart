import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:flutter_app_pharmacy/data/orders.dart';
import 'package:flutter_app_pharmacy/pages/add_to-list_page.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/profile.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/pages/list.dart';
import 'package:flutter_app_pharmacy/pages/admin.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => Cart()),
      ChangeNotifierProvider(create: (context) => orders())
    ],
    child: MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/list': (context) => List_order(),
        '/order_details': (context) => Order_D(),
        '/add_to_list_page': (context) => Add_to_list(),
        '/profile': (context) => Profile(),
        '/inventory': (context) => Admin(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        //accentColor: Colors.yellowAccent,
        // errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          /*
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          */
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            
            headline6: TextStyle(
              //fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            button: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  ));
}
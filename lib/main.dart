import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';


import './data/cart.dart';
import './data/orders.dart';
import './pages/add_to-list_page.dart';
import './pages/home.dart';
import './pages/login.dart';
import './pages/profile.dart';
import './pages/register.dart';
import './pages/list.dart';
import './pages/admin.dart';
import './pages/order_details.dart';
import './pages/loading.dart';
import './utils/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  await UserPreferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Cart()),
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
        //'/order_details': (context) => Order_D(),
        '/add_to_list_page': (context) => Add_to_list(),
        '/profile': (context) => Profile(),
        '/inventory': (context) => Admin(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.white,
        // errorColor: Colors.red,
        //brightness: Brightness.light,

        /*
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Colors.white,
              ),

              button: TextStyle(color: Colors.white),
            ),
        */
        /*
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData.fallback().copyWith(
            color: Colors.white,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.white,
                ),
                headline6: TextStyle(
                  //fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                bodyText1: TextStyle(
                  color: Colors.white,
                ),
                bodyText2: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                button: TextStyle(color: Colors.white),
              ),
        ),
        */
      ),
    ),
  ));
}

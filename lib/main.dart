import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:flutter_app_pharmacy/pages/add_to-list_page.dart';
import 'package:flutter_app_pharmacy/pages/home.dart';
import 'package:flutter_app_pharmacy/pages/loading.dart';
import 'package:flutter_app_pharmacy/pages/login.dart';
import 'package:flutter_app_pharmacy/pages/profile_page.dart';
import 'package:flutter_app_pharmacy/pages/register.dart';
import 'package:flutter_app_pharmacy/pages/list.dart';
import 'package:flutter_app_pharmacy/pages/order_details.dart';
import 'package:flutter_app_pharmacy/pages/order_nav.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => cart())],
    child: Consumer<cart>(
      builder: (context, cart, child) {
        return MaterialApp(
          initialRoute: '/login',
          routes: {
            //: (context) => Loading(),
            '/home': (context) => Home(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
            '/list': (context) => List_order(),
            '/order_details': (context) => Order_D(),
            '/add_to_list_page': (context) => Add_to_list(),
            '/profile_page': (context) => profile(),
          },
        );
      },
    )));

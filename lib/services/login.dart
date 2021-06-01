import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/data/drug_data_admin.dart';
import 'package:flutter_app_pharmacy/data/Admin_orders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_app_pharmacy/data/user.dart';


Future<DrugsByCat> getDrugs() async {
  var dataURI = Uri.http('10.0.2.2:3000', 'drugs/by_category');
  var response = await http.get(dataURI);
  if (response.statusCode != 200) {
    throw ("Server error: ${response.body}");
  }
  final String responseString = response.body;
  DrugsByCat drugsByCat = welcomeFromJson(responseString).drugsByCat;
  return drugsByCat;
}

List<String> getCatNames(DrugsByCat drugsByCat) {
  List<String> catNames = [];
  if (drugsByCat == null) {
    print('drugs are null');
  }
  drugsByCat.categoryDrugs.forEach((cat) {
    print(cat.categoryName);
    catNames.add(cat.categoryName);
  });
  return catNames;
}

void storeUserPreferences(User user) async {
  UserPreferences.setString('user_name', user.userName);
  UserPreferences.setString('user_type', user.userType);
  UserPreferences.setString('user_token', user.token);
}

void navigateToHome(BuildContext context, User user) async {
  if (user.userType == "Admin") { // Display inventory and orders tabs
    var dataURI = Uri.http('10.0.2.2:3000', 'drugs');
    var response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    String responseString = response.body;
    // Get drug inventory info
    All_Drugs drug_list = All_Drugs.fromJson(json.decode(responseString));

    // Get user orders info
    dataURI = Uri.http('10.0.2.2:3000', 'orders');
    response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    responseString = response.body;
    All_orders order_list = All_orders.fromJson(json.decode(responseString));

    print('Saving SP');
    // Store credentials in shared preference
    storeUserPreferences(user);

    Navigator.pushReplacementNamed(context, '/inventory', arguments: {
      'user_name': user.userName,
      'user_type': user.userType,
      'inventory_list': drug_list,
      'order_list': order_list,
    });
  }
  else { // Display available drugs in homepage

    DrugsByCat drugsByCat = await getDrugs();
    List<String> catNames = getCatNames(drugsByCat);

    // Store credentials in shared preference
    storeUserPreferences(user);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'user_name': user.userName,
      'user_type': user.userType,
      'drugs_by_cat': drugsByCat.getCatDrugs(),
      'cat_names': catNames,
      'user_token': user.token
    });
  }
}
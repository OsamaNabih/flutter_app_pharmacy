import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/data/user.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  User _user;
  List<bool> isCatSelected = [];
  DrugsByCat _drugsByCat;
  List<String> catNames = [];
  List<Drug> drugs = [];

  void signIn() async {
    //var loginURI = 'http://localhost:3000/users/login';
    //Android studio uses 10.0.2.2 as an alias for localhost
    print("1");
    var loginURI = Uri.http('10.0.2.2:3000', 'users/login');
    var response = await http.post(loginURI, body: {
      'user_email': emailController.text,
      'user_password': passwordController.text
    });
    print("2");
    final String responseString = response.body;
    //print(responseString);
    User user = userFromJson(responseString);
    if (response.statusCode == 200) {
      //All is well

      print('getting data');
      var dataURI = Uri.http('10.0.2.2:3000', 'drugs/by_category');
      print("Sending get request");
      response = await http.get(dataURI);
      if (response.statusCode != 200) {
        throw ("Server error: ${response.body}");
      }
      //print(response.statusCode);
      final String responseString = response.body;
      //print(responseString);
      DrugsByCat drugsByCat = welcomeFromJson(responseString).drugsByCat;
      //print(drugsByCat.getLength());
      for (int i = 0; i < drugsByCat.getLength(); i++) {
        isCatSelected.add(true);
      }
      _drugsByCat = drugsByCat;
      //await _drugsInfo();
      await _catNames();

      this._user = user;
      print("4");
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'user_name': _user.userName,
        'drugs_by_cat': drugsByCat.getCatDrugs(),
        'cat_names': catNames,
        'token': _user.token
      });
    }
  }

  /*
  void _drugsInfo() {
    print('drugsinfo');
    int selected = isCatSelected.where((item) => item == true).length;
    //print('selected $selected');
    List<Drug> drugs = [];
    if (isCatSelected.length == 0) print('Empty');

    //print(_drugsByCat.categoryDrugs);
    _drugsByCat.categoryDrugs.asMap().forEach((idx, cat_drugs) {
      //print(cat_drugs.getDrugs()[0].drugName);
      if (isCatSelected[idx]) drugs.addAll(cat_drugs.getDrugs());
    });
    this.drugs = drugs;
    //return drugs;
  }
  */

//pp
  void _catNames() {
    //print('catnames');
    //print(_drugsByCat.categoryDrugs);
    //print(_drugs_by_cat.categories[0].categoryName);
    if (_drugsByCat == null) {
      print('drugs are null');
    }
    _drugsByCat.categoryDrugs.forEach((cat) {
      print(cat.categoryName);
      catNames.add(cat.categoryName);
    });
  }

  /*
  void _onCategoryTapped(String name) {
    setState(() {
      c = name;
    });
  }
  */

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
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
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Center(
                    child: Container(
                      width: (MediaQuery.of(context).size.width * 70) / 100,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            labelText: "Enter your email"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  child: Center(
                    child: Container(
                      width: (MediaQuery.of(context).size.width * 70) / 100,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            labelText: "Enter your Password"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 60, 30, 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        height: 40,
                        child: FloatingActionButton(
                            heroTag: 'Login button',
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              //final User user = await createUser();
                              signIn();
                              //Navigator.pushReplacementNamed(context, '/home');
                            }),
                      )),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: FloatingActionButton(
                              heroTag: 'Register button',
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/register');
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}

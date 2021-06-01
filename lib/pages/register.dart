import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/pages/login.dart' as login;
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_pharmacy/services/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  User _user;

  void signUp() async {
    var loginURI = Uri.http('10.0.2.2:3000', 'users/register');
    final response = await http.post(loginURI, body: {
      "user_email": emailController.text,
      "user_password": passwordController.text,
      "user_name": nameController.text,
      "user_phone": phoneController.text
    });
    final String responseString = response.body;
    print(responseString);
    User user = userFromJson(responseString);
    print(user.toString());

    if (response.statusCode == 201) { // New resource created
      // Store credentials in shared preference
      storeUserPreferences(user);
      // Redirect to home page
      navigateToHome(context, user);
    }
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
        color: Colors.white,
        child: ListView(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Center(
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 20,
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
                width: MediaQuery.of(context).size.width * 70 / 100,
                child: TextFormField(
                  controller: nameController,
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
                      labelText: "Enter your Name"),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 70 / 100,
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
                      labelText: "Enter your Email"),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 70 / 100,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 70 / 100,
                child: TextFormField(
                  controller: phoneController,
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
                      labelText: "Enter your Phone"),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 50,
              child: FloatingActionButton(
                  heroTag: 'Register button',
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: signUp
              ),
            ),
          )
        ]),
      ),
    );
  }
}

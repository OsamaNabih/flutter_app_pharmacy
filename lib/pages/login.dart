import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/services/login.dart';
import 'package:flutter_app_pharmacy/responses/user_login_response.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserLoginResponse _user;
  DrugsByCat _drugsByCat;
  List<String> _catNames = [];
  List<Drug> drugs = [];


  void signIn() async {
    var loginURI = Uri.http('10.0.2.2:3000', 'users/login');
    var response = await http.post(loginURI, body: {
      'user_email': emailController.text,
      'user_password': passwordController.text
    });
    final String responseString = response.body;
    //print(responseString);
    UserLoginResponse user = userLoginResponseFromJson(responseString);
    if (response.statusCode == 200) {
      // Success
      // Redirect to home page
      storeUserPreferences(user);
      navigateToHome(context, user);
    }
  }

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
          backgroundColor: Theme.of(context).primaryColor,
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
                          color: Theme.of(context).primaryColor),
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
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
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
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
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
                            backgroundColor: Theme.of(context).primaryColor,
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
                              backgroundColor: Theme.of(context).primaryColor,
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
                                Navigator.pushNamed(context, '/register');
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

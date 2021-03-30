import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_pharmacy/data/user.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  User _user;

  void signIn() async {
    //var loginURI = 'http://localhost:3000/users/login';
    //Android studio uses 10.0.2.2 as an alias for localhost
    var loginURI = Uri.http('10.0.2.2:3000', 'users/login');
    print("111");
    final response = await http.post(loginURI, body: {
      'user_email': emailController.text,
      'user_password': passwordController.text
    });
    print("222");
    final String responseString = response.body;
    print(responseString);
    User user = userFromJson(responseString);
    print(user.toString());
    //sleep(Duration(seconds:2));
    //await Future.delayed(Duration(seconds: 2));
    if (response.statusCode == 200) {
      //All is well
      setState(() {
        _user = user;
      });
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'user_name': _user.userName,
        'token': _user.token
      });
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
          backgroundColor: Colors.red,
          title: Text(
            "Pharmacy App",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                        labelText: "Enter your email"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Container(
                    width: 300,
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
                          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                          labelText: "Enter your Password"),
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
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
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
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/register');
                              }
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}

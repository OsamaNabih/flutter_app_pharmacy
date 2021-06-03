import 'package:flutter/material.dart';
import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/pages/login.dart' as login;
import 'package:flutter_app_pharmacy/services/login.dart';
import 'package:flutter_app_pharmacy/responses/user_login_response.dart';
import 'package:flutter_app_pharmacy/profile/create_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  UserLoginResponse _user;

  void register(BuildContext context) async {
    var registerURI = Uri.http('10.0.2.2:3000', 'users/register');
    File file = File(_imageFile.path);
    var stream = new http.ByteStream(file.openRead());
    //print(await stream.bytesToString());
    print(await file.length);
    int length = await file.length();

    //var request = http.MultipartRequest("POST", Uri.parse("10.0.2.2:3000/users/register"));
    var request = http.MultipartRequest("POST", registerURI);
    //add text fields
    request.fields["user_email"] = emailController.text;
    request.fields["user_password"] = passwordController.text;
    request.fields["user_name"] = nameController.text;
    request.fields["user_phone"] = phoneController.text;
    request.fields["user_address"] = "El dokki";
    //File file = File(_imageFile.);
    //create multipart using filepath, string or bytes
    var multipartFile = await http.MultipartFile.fromPath("MyImage", file.path, contentType: MediaType('image','jpg'));
    print(multipartFile.contentType);
    //var multipartFile = new http.MultipartFile('MyImage', file.openRead(), length, filename: basename(file.path));

    request.files.add(multipartFile);
    var streamedResponse = await request.send();
    print('Done');
    var response = await http.Response.fromStream(streamedResponse);
    final String responseString = response.body;
    print(responseString);
    UserLoginResponse user = userLoginResponseFromJson(responseString);
    print(user.toString());

    if (response.statusCode == 201) { // New resource created
      // Store credentials in shared preference
      storeUserPreferences(user);
      // Redirect to home page
      navigateToHome(context, user);
    }
  }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/profile.jpeg")
              : FileImage(File(_imageFile.path)),
          //backgroundImage: FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet(context)),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(
                  Icons.camera,
                  //color: Colors.grey[700],
              ),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text(
                  "Camera",
                  style: TextStyle(
                    color: Colors.red,
                  ),
              ),
            ),
            TextButton.icon(
              icon: Icon(
                  Icons.image,
                  //color: Colors.grey[700],
              ),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text(
                  "Gallery",
                  style: TextStyle(
                    color: Colors.red,
                  ),
              ),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    print(pickedFile.path);
    setState(() {
      _imageFile = pickedFile;
    });
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
          SizedBox(
            height: 20,
          ),
          imageProfile(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
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
            height: 80,
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
            height: 80,
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
            height: 80,
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
                width: 150,
                child: Column(
                  children: [
                    FloatingActionButton(
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
                        onPressed: () {
                          register(context);
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                        heroTag: 'Sign in button',
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        }
                    ),
                  ],

                ),
              ),
        ]),
      ),
    );
  }
}


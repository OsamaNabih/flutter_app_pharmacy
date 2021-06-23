import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/user.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';

AppBar setAppBar(BuildContext context, Function profileNavigationHandler, String userName) {
    AppBar appBar = AppBar(
        centerTitle: false,
        title: TextButton.icon(
          icon: Icon(
            Icons.account_circle_rounded,
            size: 30,
            color: Theme.of(context).accentColor,
          ),
          label: Text(
            '$userName',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: profileNavigationHandler
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                child: TextButton.icon(
                  icon: Icon(Icons.login_outlined,
                      color: Theme.of(context).accentColor),
                  label: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                onTap: () {
                  logout(context);
                }),
          ),
        ],
      );
      return appBar;
  }


void navigateToProfile(BuildContext context, String token) async {
  var args = Jwt.parseJwt(token);
  int userId = args['user_id'];

  var dataURI = Uri.http('10.0.2.2:3000', '/users/$userId');
  var response = await http.get(dataURI, headers: {
    'Authorization': 'Bearer:$token',
  });
  if (response.statusCode != 200) {
    throw ("Server error: ${response.body}");
  }

  final String responseString = response.body;
  User user = userFromJson(responseString);

  Navigator.pushNamed(context, '/profile', arguments: {
    'user': user,
    'user_token': token,
  });
}

void logout(BuildContext context) {
  UserPreferences.removeString("user_name");
  UserPreferences.removeString("user_type");
  UserPreferences.removeString("user_token");
  Navigator.popAndPushNamed(context, '/login');
}

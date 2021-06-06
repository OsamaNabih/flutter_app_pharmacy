import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/user.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';

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

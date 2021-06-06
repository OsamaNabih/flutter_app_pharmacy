import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_app_pharmacy/services/login.dart';
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';
import 'package:flutter_app_pharmacy/responses/user_login_response.dart';

void getHomePage(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 1000), () {});
  String token = UserPreferences.getString('user_token');
  String userName = UserPreferences.getString('user_name');
  String userType = UserPreferences.getString('user_type');
  int userId = Jwt.parseJwt(token)['user_id'];
  print('SP token: $token');

  if (token == null || Jwt.getExpiryDate(token).isBefore(DateTime.now())) // No previous sign in or Sign in session expired
    Navigator.pushReplacementNamed(context, '/login');
  else {
    await navigateToHome(
        context, UserLoginResponse.data(userId, userName, userType, token));
  }
}

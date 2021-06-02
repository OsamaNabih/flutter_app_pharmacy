import 'dart:convert';
import 'package:flutter/material.dart';
User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userName,
    this.userType,
    this.userEmail,
    this.userPassword = '',
    this.userPhone,
    this.userAddress,
  });

  User.data({@required String userName, @required String userType, @required String userEmail, String userPassword, @required String userPhone, @required String userAddress}) {
    this.userName = userName;
    this.userType = userType;
    this.userEmail = userEmail;
    this.userPassword = userPassword;
    this.userPhone = userPhone;
    this.userAddress = userAddress;
  }


  String userName;
  String userType;
  String userEmail;
  String userPassword = '';
  String userPhone;
  String userAddress;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["user_name"],
    userType: json["user_type"],
    userEmail: json["user_email"],
    userPassword: json["user_password"] ?? '',
    userPhone: json["user_phone"],
    userAddress: json["user_address"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "user_type": userType,
    "user_email": userEmail,
    "user_password": userPassword,
    "user_phone": userPhone,
    "userAddress": userAddress,
  };
}

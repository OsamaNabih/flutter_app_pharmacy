// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.message,
    this.token,
    this.userName,
  });

  String message;
  String token;
  String userName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    message: json["message"],
    token: json["token"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user_name": userName,
  };
}

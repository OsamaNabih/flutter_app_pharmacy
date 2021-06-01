import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.message,
    this.token,
    this.userName,
    this.userType,
  });

  User.data(String userName, String userType, String token) {
    this.userName = userName;
    this.userType = userType;
    this.token = token;
  }

  String message;
  String token;
  String userName;
  String userType;

  factory User.fromJson(Map<String, dynamic> json) => User(
    message: json["message"],
    token: json["token"],
    userName: json["user_name"],
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user_name": userName,
    "user_type": userType,
  };
}

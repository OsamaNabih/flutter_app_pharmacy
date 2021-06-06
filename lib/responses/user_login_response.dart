import 'dart:convert';

UserLoginResponse userLoginResponseFromJson(String str) => UserLoginResponse.fromJson(json.decode(str));

String userLoginResponseToJson(UserLoginResponse data) => json.encode(data.toJson());

class UserLoginResponse {
  UserLoginResponse({
    this.message,
    this.token,
    this.userName,
    this.userType,
    this.userId,
  });

  UserLoginResponse.data(int userId, String userName, String userType, String token) {
    this.userId = userId;
    this.userName = userName;
    this.userType = userType;
    this.token = token;
  }

  int userId;
  String message;
  String token;
  String userName;
  String userType;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => UserLoginResponse(
    message: json["message"],
    token: json["token"],
    userName: json["user_name"],
    userType: json["user_type"],
    userId: json["user_id"] ?? -1,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user_name": userName,
    "user_type": userType,
    "user_id": userId,
  };
}

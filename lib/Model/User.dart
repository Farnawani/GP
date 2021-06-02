// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
//
//
// class User extends ChangeNotifier {
//
//   String name;
//   String email;
//   String password;
//   String mobileNumber;
//
//   User(this.name, this.email, this.password);
//   User.signUpUser(this.name, this.email, this.password, this.mobileNumber);
//   User.loggedIn(this.email, this.password);
//
//   static Future<Map<String, dynamic>> signUp(String url, User user) async {
//     Uri uri = Uri.parse(url);
//     final response = await http.post(uri,
//         headers: {"Content-Type": "application/json",       'Accept': 'application/json',},
//         body: json.encode({
//           "name": user.name,
//           "email": user.email,
//           "password": user.password,
//           "phone": user.mobileNumber
//         }));
//     Map<String, dynamic> convertDataToJson = json.decode(response.body);
//     print(convertDataToJson['message']);
//     return convertDataToJson;
//   }
//
//   static Future<Map<String, dynamic>> logIn(
//       String url, String emailAddress, String password) async {
//     Uri uri = Uri.parse(url);
//     final response = await http.post(uri,
//         headers: {"Content-Type": "application/json",   'Accept': 'application/json'},
//         body: json.encode({"email": emailAddress, "password": password}));
//     Map<String, dynamic> convertDataToJson = json.decode(response.body);
//     print(convertDataToJson['message']);
//     return convertDataToJson;
//   }
// }
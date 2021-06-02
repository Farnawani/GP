import 'package:http/http.dart' as http;
import 'dart:convert';

class Doctor {
  final String uid;
  final String userName;
  final String userEmail;
  final String gender;
  final String address;
  final String password;
  final String phoneNumber;
  final String dateOfBirth;
  final String department;
  final String history;
  List<Map> availableTimes;
  String scheduledTimes;
  String prescription;

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      userName: json['userName'],
      userEmail: json['email'],
      gender: json['gender'],
      address: json['address'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'],
      department: json['department'],
      history: json['history'],
      availableTimes: json['availableTimes'],
    );
  }

  Future<Doctor> searchForDoctor(String name) async {
    print("Getting");
    var url = Uri.parse("http://10.0.2.2:5000/api/doctorSearch/${name}");

    http.Response response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return Doctor.fromJson(jsonDecode(response.body));
  }

  Doctor({
    this.uid,
    this.userName,
    this.userEmail,
    this.gender,
    this.dateOfBirth,
    this.password,
    this.phoneNumber,
    this.address,
    this.department,
    this.history,
    this.availableTimes,
  });
}

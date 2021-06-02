import 'package:flutter/material.dart';
import 'package:gp/doctor_profile.dart';
import 'package:gp/home.dart';
import 'package:gp/search.dart';
import 'package:gp/searchBarDemoHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        Search.id: (context) => Search(),
        DoctorProfile.id: (context) => DoctorProfile(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SearchBarDemoHome(),
      home: Home(),
    );
  }
}

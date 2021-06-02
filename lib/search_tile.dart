import 'package:flutter/material.dart';
import 'package:gp/doctor_profile.dart';
import 'package:gp/doctor.dart';

class SearchTile extends StatelessWidget {
  final Doctor doctor;

  SearchTile({this.doctor}); // const SearchTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, DoctorProfile.id, arguments: doctor);
        },
        tileColor: Color(0xFFEFF2F3),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('images/farna.jpg'),
        ),
        title: Text(
          doctor.userName,
          // 'Farnawani',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        subtitle: Text('Specialty: ${doctor.department}'),
        // subtitle: Text('Specialty'),
        isThreeLine: true,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gp/doctor_profile.dart';
import 'package:gp/search_tile.dart';
import 'doctor.dart';

class Search extends StatefulWidget {
  static const String id = 'search';

  List<Doctor> doctors = [];

  List<SearchTile> searchTiles = [
    SearchTile(),
    SearchTile(),
    SearchTile(),
    SearchTile(),
  ];

  // const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController myController;
  Doctor doctor;
  Future<Doctor> futureDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /** BACK BUTTON*/
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_backspace_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: myController,
                    onChanged: (value) {
                      myController.text = value;
                    },
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Search Doctor',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    futureDoctor = doctor.searchForDoctor(myController.text);
                  },
                  child: Text('Search'),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFEFF2F3),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DoctorProfile.id);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('images/farna.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DoctorProfile.id);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('images/farna.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DoctorProfile.id);
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('images/farna.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
                future: futureDoctor,
                builder:(context, snapshot){
                  final doctorData = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SearchTile(doctor: doctorData);

                  } else {
                    return CircularProgressIndicator();
                  }
                }
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFE4EBED),
    );
  }
}
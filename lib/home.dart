import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/search.dart';
import 'package:gp/tilee.dart';

// import 'package:flutter_search_bar/flutter_search_bar.dart';
// import 'package:gp/scroll.dart';

TextEditingController editingController = TextEditingController();

class Home extends StatelessWidget {
  static const String id = 'home';

  // List<Tilee> tiles = [];

  List<Tilee> tiles = [
    Tilee(
      mainColor: Color(0xFF549BFF),
      day: '14',
      month: 'August',
      doctorName: 'Farnawani',
      doctorSpecialty: 'Everything',
    ),
    Tilee(
      mainColor: Color(0xFFFFB051),
      day: '1',
      month: 'June',
      doctorName: 'Yasmine',
      doctorSpecialty: 'Heart',
    ),
    Tilee(
      mainColor: Color(0xFF285982),
      day: '3',
      month: 'March',
      doctorName: 'Etsh',
      doctorSpecialty: 'Alwaza',
    ),
    Tilee(
      mainColor: Color(0xFF55BA40),
      day: '24',
      month: 'February',
      doctorName: 'Ansary',
      doctorSpecialty: 'Bones',
    ),
    Tilee(
      mainColor: Color(0xFFFF55BF),
      day: '15',
      month: 'November',
      doctorName: 'Nadine',
      doctorSpecialty: 'Nose',
    ),
    Tilee(
      mainColor: Color(0xFF549BFF),
      day: '14',
      month: 'August',
      doctorName: 'Farnawani',
      doctorSpecialty: 'Everything',
    ),
    //   Tilee(
    //     mainColor: Color(0xFFFFB051),
    //     day: '1',
    //     month: 'June',
    //     doctorName: 'Yasmine',
    //     doctorSpecialty: 'Heart',
    //   ),
    //   Tilee(
    //     mainColor: Color(0xFF549BFF),
    //     day: '24',
    //     month: 'February',
    //     doctorName: 'Ansary',
    //     doctorSpecialty: 'Bones',
    //   ),
    //   Tilee(
    //     mainColor: Color(0xFFFF55BF),
    //     day: '15',
    //     month: 'November',
    //     doctorName: 'Nadine',
    //     doctorSpecialty: 'Nose',
    //   ),
  ];

  // const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          /** LEVEL 1 COLUMN **/
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/farna.jpg'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                /** LEVEL 2 COLUMN **/
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEFF2F3),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 8.0),
                                child: Text(
                                  'Let\'s Find Your\nDoctor',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF222E54),
                                    // backgroundColor: Color(0xFFEFF2F3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Search.id);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                // color: Colors.white,
                                child: Row(
                                  children: [
                                    Icon(Icons.search),
                                    Text('Search For A Doctor')
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xFFEFF2F3),
                      ),
                      child: tiles.isNotEmpty
                          ? ListView(
                              children: tiles,
                            )
                          : Center(
                              child: Text(
                                'You Do Not Have Any Reserved Appointments Yet.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF222E54),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Search.id);
                      },
                      child: Text('Reserve Appointment'),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Color.fromRGBO(239, 236, 249, 1),
      backgroundColor: Color(0xFFE4EBED),
    );
  }
}

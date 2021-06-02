import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/doctor.dart';
import 'package:gp/time_card.dart';
import 'appointment.dart';

class DoctorProfile extends StatefulWidget {
  static const String id = 'doctor_profile';
  final doctorInfo;
  final specialty;
  List<String> doctorTimes;

  //GET REQUEST

  DoctorProfile({this.doctorInfo, this.specialty, this.doctorTimes}); // const DoctorProfile({Key key}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool isButtonDisabled = true;
  Appointment appointment;
  List<Map> times;
  List<TimeCard> returnedTimes;


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Doctor;
    final timesMap = args.availableTimes.asMap();
    List<TimeCard> timeCards(){
      for(dynamic x in timesMap.values){
        times.add(x);
        for(var y in x['Time']){
          returnedTimes.add(TimeCard(y.values));
        }
      }
      return returnedTimes;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xFFEFF2F3),
                ),
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /** DOCTOR IMAGE **/
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/farna.jpg'),
                        radius: 70,
                      ),
                    ),
                    /** DOCTOR NAME **/
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                      child: Text(
                        // 'Abdelrahman Elfarnawani',
                        args.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Color(0xFF2C385C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    /** DOCTOR SPECIALTY **/
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                      child: Text(
                        // 'Specialty: Can Do Anything',
                        args.department,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xFF383535),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Pick a time',
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFEFF2F3),
                ),
                height: 190,
                child: GridView.count(
                  childAspectRatio: 2.8,
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,
                  children: timeCards(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                onPressed: isButtonDisabled
                    ? null
                    : () {
                        // Navigator.pushNamed(context, Search.id);
                        appointment.reserveAppointment();
                      },
                child: Text('Reserve'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
      backgroundColor: Color(0xFFE4EBED),
    );
  }
}

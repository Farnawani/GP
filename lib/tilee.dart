import 'package:flutter/material.dart';

class Tilee extends StatelessWidget {
  final mainColor;
  final doctorName;
  final doctorSpecialty;
  final day;
  final month;
  final time;

  const Tilee(
      {this.mainColor,
      this.doctorName,
      this.doctorSpecialty,
      this.day,
      this.month,
      this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF4F6F7),
        ),

        /** MAIN TILE ROW */
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /** DATE CONTAINER */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /** DAY */
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          day,
                          style: TextStyle(fontSize: 21, color: Colors.white),
                        ),
                      ),
                      /** MONTH */
                      FittedBox(
                        fit: BoxFit.fill,

                        child: Text(
                          month,
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(doctorSpecialty),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

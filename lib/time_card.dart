import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final time;

  TimeCard(this.time); // const TimeCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Color(0xFFA1AAAD),
        color: Color(0xFFA1AAAD),
        borderRadius: BorderRadius.circular(20),
      ),
      // height: 10,
      // width: 20,
      child: Center(
        child: ElevatedButton(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:http/http.dart' as http;
import 'dart:convert';

class Appointment {
  final doctorInfo;
  final time;
  final patientInfo;


  Appointment(this.doctorInfo, this.time, this.patientInfo);

  reserveAppointment() async {
    print("posting");
    var url = Uri.parse('http://10.0.2.2:5000/api/appointment');

    Map data = {
      'doctorInfo': doctorInfo,
      'time': time,
      'patientInfo': patientInfo,
    };

    String body = json.encode(data);

    http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


  }

}
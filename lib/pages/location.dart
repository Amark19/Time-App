import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ChooseLoc extends StatefulWidget {
  _chooseLocState createState() => _chooseLocState();
}

class _chooseLocState extends State<ChooseLoc> {
  void getTime() async {
    var url = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kolkata');
    var response = await http.get(url);
    Map data = convert.jsonDecode(response.body);

    //get properties of datetime
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    print(offset);

    //creating datetime object
    DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    print(datetime);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}

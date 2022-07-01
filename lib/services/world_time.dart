import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

class Worldtime {
  String location; //location name for UI
  String time = ""; //time in that location
  String flag; //url to asset flag icon
  String url; //location of url for api endpoints
 
  Worldtime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var ur = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(ur);
      Map data = convert.jsonDecode(response.body);
      //get properties of datetime
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //creating datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: 30));
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could not get time data";
    }
  }
}

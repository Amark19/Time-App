import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;

class Worldtime {
  String location; //location name for UI
  String time = ""; //time in that location
  String flag; //url to asset flag icon
  String url; //location of url for api endpoints
  bool isDayTime = true; //show is it a day or night

  Worldtime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var ur = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(ur);
      Map data = convert.jsonDecode(response.body);
      //get properties of datetime
      String datetime = data['datetime'].substring(11, 16);
      bool isampm = int.parse(datetime.substring(0, 2)) >= 0 && int.parse(datetime.substring(0, 2)) < 12;
      if (isampm) {
        time = datetime + " am";
      } else {
        time = datetime + " pm";
      }
      isDayTime = int.parse(datetime.substring(0, 2)) >= 12 && int.parse(datetime.substring(0, 2)) < 20;
    } catch (e) {
      print(e);
      time = "could not get time data";
    }
  }
}

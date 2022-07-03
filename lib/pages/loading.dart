import 'package:flutter/material.dart';
import 'package:myapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<Loading> {
  void SetWorldTime() async {
    Worldtime inst = Worldtime(location: "Kolkata", flag: "Kolkata.png", url: "Asia/Kolkata");
    await inst.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDayTime': inst.isDayTime
    });
    // setState(() {
    //   time = inst.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    SetWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitFadingFour(
      color: Colors.blue,
      size: 50.0,
    )));
  }
}

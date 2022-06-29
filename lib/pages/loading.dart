import 'package:flutter/material.dart';
import 'package:myapp/services/world_time.dart';

class Loading extends StatefulWidget {
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<Loading> {
  String time = "loading";
  void SetWorldTime() async {
    Worldtime inst = Worldtime(location: "Mumbai", flag: "Mumbai.png", url: "Asia/Kolkata");
    await inst.getTime();
    setState(() {
      time = inst.time;
    });
    print(inst.time);
  }

  @override
  void initState() {
    super.initState();
    SetWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50),
      child: Text(time),
    ));
  }
}

import 'package:flutter/material.dart';

class ChooseLoc extends StatefulWidget {
  _chooseLocState createState() => _chooseLocState();
}

class _chooseLocState extends State<ChooseLoc> {
  void getData() async {
    String username = await Future.delayed(
      Duration(seconds: 3),
      () => "amar",
    );
    String bio = await Future.delayed(
      Duration(seconds: 3),
      () => "I am 21 yrs old,doing good!",
    );
    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("hello");
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

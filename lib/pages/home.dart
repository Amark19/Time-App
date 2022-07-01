import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)!.settings.arguments as Map; //if we not add ! then the error will pop as "receiver can be null"..so by adding ! it will only progress if it is not nul
    print(data);
    // setState(() {

    // });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(children: [
          FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location')),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(data['location'],
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 2,
                )),
          ]),
          SizedBox(height: 10),
          Text(
            data['time'],
            style: TextStyle(
              fontSize: 66,
            ),
          )
        ]),
      )),
    );
  }
}

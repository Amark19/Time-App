import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map; //if we not add ! then the error will pop as "receiver can be null"..so by adding ! it will only progress if it is not nul
    print(data);
    String durl = "https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-33/world_time_app/assets/day.png";
    String nurl = "https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-33/world_time_app/assets/night.png";
    String bgimg = data['isDayTime'] ? durl : nurl;
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.indigo.shade200;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bgimg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(children: [
            FlatButton.icon(
                onPressed: () async {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                textColor: Colors.grey[200],
                label: Text('Edit Location')),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(data['location'],
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey[200],
                    letterSpacing: 2,
                  )),
            ]),
            SizedBox(height: 10),
            Text(
              data['time'],
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 66,
              ),
            )
          ]),
        ),
      )),
    );
  }
}

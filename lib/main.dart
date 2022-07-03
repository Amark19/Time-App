import 'dart:js';

import 'package:flutter/material.dart';
import '/pages/home.dart';
import '/pages/loading.dart';
import 'pages/location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLoc()
      },
    ));

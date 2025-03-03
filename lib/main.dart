import 'package:flutter/material.dart';
import 'package:lachi_app/screens/home/home_screen.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(const LachiApp()); //this code must be present in main.dart file
}

class LachiApp extends StatelessWidget {
  const LachiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return const MaterialApp(
      debugShowCheckedModeBanner: false, //removes debug banner
      title: "Lachi App",

      home: HomeScreen(), // starts the app at the homescreen
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hostel_space/additional/SplashScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hostel Space",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.pink[300],
        accentColor: Colors.pinkAccent,
      ),
    );
  }
}

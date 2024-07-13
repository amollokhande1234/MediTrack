import 'package:flutter/material.dart';
import 'package:meditrack/Screens/HomeSceen.dart';
import 'package:meditrack/Screens/welcome_screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

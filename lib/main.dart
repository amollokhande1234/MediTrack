import 'package:flutter/material.dart';
import 'package:meditrack/Screens/home_screen.dart';
import 'package:meditrack/Screens/welcome_screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
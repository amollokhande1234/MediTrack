import 'package:flutter/material.dart';
import 'package:meditrack/Screens/ListTiles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Container(
              child: Text(
                "Mon, 22, Aug",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Today's Plan: ",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            ListTiles(),
            SizedBox(height: 25),
            ListTiles(),
            SizedBox(height: 25),
            ListTiles(),
          ],
        ),
      ),
    );
  }
}

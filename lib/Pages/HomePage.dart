import 'package:flutter/material.dart';
import 'package:meditrack/Screens/ListTiles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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

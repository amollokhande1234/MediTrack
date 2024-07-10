import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "08:00",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 80,
          width: 350,
          margin: EdgeInsets.only(bottom: 8), // Add margin between items
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ListTile(
            leading: Image(
              width: 50,
              height: 50,
              image: AssetImage("assets/images/file.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    "Omega - 3",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "08:00",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "1 pill once per day",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15,
                fontFamily: "Poppins-SemiBold",
              ),
            ),
            trailing: Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }
}

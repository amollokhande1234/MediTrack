import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
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
            Text(
              "08:00",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            listTile(),
          ],
        ),
      ),
    );
  }
}

// Widget listTile() {
//   return Container(
//     height: 80,
//     width: 350,
//     decoration: BoxDecoration(
//         color: Colors.blueAccent,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               spreadRadius: 0,
//               blurRadius: 5,
//               offset: Offset(0.00000, 3))
//         ],
//         borderRadius: BorderRadius.all(Radius.circular(12))
//         // borderRadius: BorderRadius.only(
//         //   bottomLeft: Radius.circular(18),
//         //   bottomRight: Radius.circular(18),
//         // ),
//         ),
//     child: Expanded(
//       child: ListView.separated(
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Image(
//                   width: 50,
//                   height: 50,
//                   image: AssetImage(
//                     "assets/images/file.png",
//                   )),
//               title: Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Text(
//                   "Location 1 - Banner",
//                   style: TextStyle(
//                     decoration: TextDecoration.none,
//                     // color: CustomColors.primary,
//                     fontFamily: "Poppins-Medium",
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//               subtitle: Text(
//                 // "data",
//                 "103, Victory Landmark, Baner Rd, opp. D Mart,Pune, Maharashtra 411045",
//                 style: TextStyle(
//                     decoration: TextDecoration.none,
//                     fontSize: 10,
//                     fontFamily: "Poppins-SemiBold"),
//               ),
//               trailing: Icon(Icons.more_vert),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return Divider(
//               thickness: 0.0000000000001,
//             );
//           },
//           itemCount: 1),
//     ),
//   );
// }

Widget listTile() {
  return Container(
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
  );
}

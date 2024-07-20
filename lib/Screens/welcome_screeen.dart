// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               height: 400,
//               width: 150,
//               child: Image(
//                   alignment: Alignment.bottomCenter,
//                   image: AssetImage(
//                     "assets/images/file.png",
//                   )),
//             ),
//           ),
//           SizedBox(height: 20),
//           Container(
//             child: Text(
//               "Medicine Reminder",
//               style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 2),
//             child: Text(
//               textAlign: TextAlign.center,
//               "We're here to help you stay on top of",
//               style: TextStyle(
//                   fontSize: 17,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w300),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 2),
//             child: Text(
//               textAlign: TextAlign.center,
//               "your Medication Schedule",
//               style: TextStyle(
//                   fontSize: 17,
//                   fontFamily: "Open-Sans-Medium",
//                   color: Colors.black,
//                   fontWeight: FontWeight.w300),
//             ),
//           ),
//           SizedBox(height: 50),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text(
//               'Custom Button',
//               style: TextStyle(fontSize: 22),
//             ),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white,
//               backgroundColor: Color.fromARGB(255, 25, 106, 172),
//               minimumSize: Size(350, 60), // width, height
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10), // Border radius
//                 side: BorderSide(
//                     color: Colors.blue, width: 2), // Border color and width
//               ), // Text color
//             ),
//           )
//           // Container(
//           //   decoration: BoxDecoration(
//           //       color: Colors.green,
//           //       borderRadius: BorderRadius.all(Radius.circular(5))),
//           //   height: 45,
//           //   width: 300,
//           //   child: ElevatedButton(
//           //     onPressed: () {},
//           //     child: Text("Get Started"),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

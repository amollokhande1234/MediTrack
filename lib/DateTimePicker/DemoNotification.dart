// import 'package:flutter/material.dart';
// import 'package:meditrack/Pages/NotificatiionDemo.dart';

// class DemoNotification extends StatefulWidget {
//   const DemoNotification({super.key});

//   @override
//   State<DemoNotification> createState() => _DemoNotificationState();
// }

// class _DemoNotificationState extends State<DemoNotification> {
//   final NotificationService _notificationService = NotificationService();

//   @override
//   void initState() {
//     super.initState();
//     _notificationService.initNotification();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: OutlinedButton(
//             onPressed: () {
//               _notificationService.showNotification(
//                   title: "Medicine Added",
//                   body: 'Reminder set for ${DateTime.now()}');
//             },
//             child: Text("Show Notification")),
//       ),
//     );
//   }
// }

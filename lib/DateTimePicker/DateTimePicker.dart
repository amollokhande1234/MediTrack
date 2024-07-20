// import 'package:flutter/material.dart';

// // Usage
// import 'package:meditrack/Pages/NotificatiionDemo.dart';

// DateTime scheduleTime = DateTime.now();

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => NotificationScreenState();
// }

// class NotificationScreenState extends State<NotificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Notification Demo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             DateTimePicker(),
//             ScheduleButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DateTimePicker extends StatefulWidget {
//   const DateTimePicker({super.key});

//   @override
//   State<DateTimePicker> createState() => _DateTimePickerState();
// }

// class _DateTimePickerState extends State<DateTimePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         DatePicker.showDateTimePicker(
//           context,
//           showTitleActions: true,
//           onChanged: (date) {
//             setState(() {
//               scheduleTime = date;
//             });
//           },
//           onConfirm: (date) {
//             setState(() {
//               scheduleTime = date;
//             });
//           },flutter pub add syncfusion_flutter_datepicker
//           currentTime: DateTime.now(),
//           locale: LocaleType.en,
//         );
//       },
//       child: Text("Select Date Time"),
//     );
//   }
// }

// class ScheduleButton extends StatelessWidget {
//   const ScheduleButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         debugPrint('Notification Scheduled for $scheduleTime');
//         NotificationService().showNotification(
//             title: "Scheduled Notification",
//             body: '$scheduleTime',
//             scheduleNotificationDateTime: scheduleTime);
//       },
//       child: Text("Schedule Notification"),
//     );
//   }
// }

// class NotificationService {
//   void showNotification({
//     required String title,
//     required String body,
//     required DateTime scheduleNotificationDateTime,
//   }) {
//     // Add your notification scheduling logic here
//   }
// }

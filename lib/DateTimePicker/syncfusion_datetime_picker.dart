import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DateTimePIcker extends StatefulWidget {
  @override
  _DateTimePIckerState createState() => _DateTimePIckerState();
}

class _DateTimePIckerState extends State<DateTimePIcker> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(DateTime scheduledDate) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high, showWhen: false);

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Scheduled Notification',
      'This is the notification scheduled for the selected date and time.',
      scheduledDate,
      platformChannelSpecifics,
    );
  }

  Future<void> _selectDateTime() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        DateTime finalDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        await _scheduleNotification(finalDateTime);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Notification scheduled for $finalDateTime')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker Notification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _selectDateTime,
          child: Text('Select Date and Time'),
        ),
      ),
    );
  }
}

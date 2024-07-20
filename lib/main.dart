import 'package:flutter/material.dart';
import 'package:meditrack/DateTimePicker/syncfusion_datetime_picker.dart';
import 'package:meditrack/DateTimePicker/DateTimePicker.dart';
import 'package:meditrack/DateTimePicker/DemoNotification.dart';
import 'package:meditrack/DateTimePicker/NotificatiionDemo.dart';
import 'package:meditrack/Screens/HomeSceen.dart';
import 'package:meditrack/Screens/welcome_screeen.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: DemoNotification(),
      // home: NotificationScreen(),
    );
  }
}

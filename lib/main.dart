import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditrack/DateTimePicker/syncfusion_datetime_picker.dart';
import 'package:meditrack/Pages/Cantact/AddContact.dart';
import 'package:meditrack/Pages/Cantact/MedicinePage.dart';
// import 'package:meditrack/DateTimePicker/DateTimePicker.dart';
// import 'package:meditrack/DateTimePicker/DemoNotification.dart';
// import 'package:meditrack/DateTimePicker/NotificatiionDemo.dart';
import 'package:meditrack/Screens/HomeSceen.dart';

// import 'package:timezone/data/latest.dart' as tz;
// import 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        // home: const AddContact(),
        // home: EmergencyContact(),
        // home: DemoNotification(),
        // home: NotificationScreen(),
      ),
    );
  }
}

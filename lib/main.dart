import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditrack/Pages/CustomDrawer.dart';
import 'package:meditrack/Screens/HomeSceen.dart';

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
        // home: CustomDrawer(),
        home: HomeScreen(),
        // home: const AddContact(),
        // home: EmergencyContact(),
        // home: DemoNotification(),
        // home: NotificationScreen(),
      ),
    );
  }
}

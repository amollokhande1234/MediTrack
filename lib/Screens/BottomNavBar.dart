import 'package:flutter/material.dart';
import 'package:meditrack/Pages/AddReminder.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Color.fromARGB(255, 195, 63, 63),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: "History",
          icon: Icon(
            Icons.history,
          ),
        ),
        BottomNavigationBarItem(
          label: "Add Medications",
          icon: Icon(
            Icons.add_circle_rounded,
          ),
        ),
        BottomNavigationBarItem(
          label: "Call",
          icon: Icon(
            Icons.call_made,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddReminderPage()));
            },
            icon: Icon(
              Icons.person,
            ),
          ),
        ),
      ],
    );
  }
}

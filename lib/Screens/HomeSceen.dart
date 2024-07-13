import 'package:flutter/material.dart';
import 'package:meditrack/Pages/AddReminder.dart';
import 'package:meditrack/Pages/HishtoryPage.dart';
import 'package:meditrack/Pages/HomePage.dart';
import 'package:meditrack/Pages/MedicinePage.dart';
import 'package:meditrack/Pages/ProfilePage.dart';
import 'package:meditrack/Screens/ListTiles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          HistoryPage(),
          AddReminderPage(),
          MedicinePage(),
          ProfilePage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Add Medication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_rounded),
            label: 'Medicines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


// class AddReminderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Hello");
//   }
// }

// class AddReminderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Reminder'),
//       ),
//       body: Center(
//         child: Text('Add Reminder Page'),
//       ),
//     );
//   }
// }

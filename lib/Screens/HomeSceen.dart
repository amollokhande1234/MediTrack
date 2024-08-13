import 'package:flutter/material.dart';
import 'package:meditrack/Pages/AddReminder.dart';
import 'package:meditrack/Pages/CustomDrawer.dart';
import 'package:meditrack/Pages/HomePage.dart';
import 'package:meditrack/Pages/Cantact/ContactScreen.dart';
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
      appBar: AppBar(
        title: Text("M E D I T R A C K"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientInfoPage()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      drawer: CustomDrawer(),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          EmergencyContact(),
          // HishtoryMedicines(),
          // // AddReminderPage(),
          // ProfilePage(),
        ],
        onPageChanged: (index) {
          setState(() {
            int index = 1;
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
            icon: Icon(Icons.contact_emergency),
            label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddReminderPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

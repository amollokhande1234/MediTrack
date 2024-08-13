import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditrack/Pages/ApointmentPage.dart';
import 'package:meditrack/Pages/HishtoryPage.dart';
import 'package:meditrack/Pages/HomePage.dart';
import 'package:meditrack/Screens/HomeSceen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      backgroundColor: Colors.deepPurple[100],
      child: Container(
        // color: Colors.amber,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              height: 150,
              child: Center(
                child: Column(
                  children: [
                    // Profile Photo
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        bottom: 10,
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/amol.png",
                            width: 70, // Diameter of the circle (2 * radius)
                            height: 70, // Diameter of the circle (2 * radius)
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Amol Lokhande",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  CustomListItems(
                    icons: Icon(Icons.home_outlined),
                    ontap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      });
                    },
                    name: "Home",
                  ),
                  CustomListItems(
                    ontap: () {
                      setState(() {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HishtoryMedicines(context),
                        //   ),
                        // );
                      });
                    },
                    icons: Icon(Icons.history_outlined),
                    name: "Hishtory",
                  ),
                  CustomListItems(
                    ontap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentPage(),
                          ),
                        );
                      });
                    },
                    icons: Icon(Icons.meeting_room_outlined),
                    name: "Appointment",
                  ),
                  CustomListItems(
                    ontap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      });
                    },
                    icons: Icon(Icons.medical_information_outlined),
                    name: "Medicine Info",
                  ),
                  CustomListItems(
                    ontap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      });
                    },
                    icons: Icon(Icons.logout_outlined),
                    cls: Color.fromARGB(255, 233, 104, 95),
                    name: "Log Out",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItems extends StatefulWidget {
  final Icon icons;
  final String name;
  final Color? cls;
  final VoidCallback? ontap;
  const CustomListItems({
    super.key,
    required this.icons,
    required this.name,
    this.cls,
    this.ontap,
  });

  @override
  State<CustomListItems> createState() => _CustomListItemsState();
}

class _CustomListItemsState extends State<CustomListItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.ontap != null) {
          widget.ontap!(); // Call the provided ontap callback function
        }
        print("Clicked");
      },
      child: ListTile(
        title: Row(
          children: [
            Icon(
              widget.icons.icon,
              color: widget.cls ?? Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              // "${widget.name}",
              widget.name,
              style: TextStyle(
                fontSize: 17,
                color: widget.cls ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

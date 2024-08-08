import 'package:flutter/material.dart';

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

            // width: 400,
            // color: Colors.amber,
            // child: Center(
            //   child: Column(
            //     mainAxisAlignment:
            //         MainAxisAlignment.center, // Center items vertically
            //     crossAxisAlignment:
            //         CrossAxisAlignment.center, // Center items horizontally
            //     children: [
            //       CustomListItems(
            //         icons: Icon(Icons.home_outlined),
            //         name: "Home",
            //       ),
            //       CustomListItems(
            //         icons: Icon(Icons.home_outlined),
            //         name: "Medicine Info",
            //       ),
            //       CustomListItems(
            //         icons: Icon(Icons.home_outlined),
            //         name: "History",
            //       ),
            //       CustomListItems(
            //         icons: Icon(Icons.home_outlined),
            //         name: "Appointments",
            //       ),
            //       CustomListItems(
            //         icons: Icon(Icons.home_outlined),
            //         name: "Log Out",
            //         cls: Color.fromARGB(255, 240, 136, 146),
            //       ),
            //     ],
            //   ),
            // ),
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
  const CustomListItems(
      {super.key, required this.icons, required this.name, this.cls});

  @override
  State<CustomListItems> createState() => _CustomListItemsState();
}

class _CustomListItemsState extends State<CustomListItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            widget.icons.icon,
            color: widget.cls ?? Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Text(
              // "${widget.name}",
              widget.name,
              style: TextStyle(
                fontSize: 17,
                color: widget.cls ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditrack/Pages/AddReminder.dart';
import 'package:meditrack/Pages/HishtoryPage.dart';
import 'package:meditrack/Screens/ListTiles.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> items = [];
List<String> hishtory = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Container(
              // crossAxisAlignment: CrossAxisAlignment.start,
              child: Container(
                child: const Column(
                  children: [
                    Text(
                      "Mon, 22, Aug",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Today's Plan: ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5.h),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // color: Colors.green,
                      color: Colors.white54,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Image.asset(
                          "assets/images/file.png",
                          width: 65,
                          height: 65,
                        ),
                        SizedBox(height: 10),
                        Text(
                          // "Tablet Name ",
                          items[index],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Center(
                                        child: Text(
                                            "You have taken this medicine before. Do you want to add it to your history?"),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Cansel",
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              hishtory.add(items[index]);
                                              HishtoryMedicines(
                                                  table: hishtory[index]);
                                              items.removeAt(index);
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HistoryPage(),
                                                ),
                                              );
                                            });
                                          },
                                          child: Text(
                                            "Taken",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                              icon: const Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  items.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrack/Pages/HomePage.dart';
import 'package:meditrack/Screens/HomeSceen.dart';
import 'package:meditrack/Screens/ListTiles.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AddReminderPage extends StatefulWidget {
  final Function(Map<String, String>)? onMedicineAdded;
  const AddReminderPage({Key? key, this.onMedicineAdded}) : super(key: key);

  @override
  State<AddReminderPage> createState() => _AddReminderPageState();
}

class GridItem {
  final String title;
  GridItem({required this.title});
}

class _AddReminderPageState extends State<AddReminderPage> {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();

  List<GridItem> gridItms = [];
  void addGridItem() {
    setState(() {
      Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()))
          .then((GridItem) {
        if (GridItem != null) {
          setState(() {
            gridItms.add(GridItem);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.lightGreen,
        backgroundColor: const Color.fromARGB(255, 7, 62, 87),
        title: const Text(
          "Add Medicine",
          style: TextStyle(
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      "Medicine Information",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    CustomContainer(
                      // hint: "Medicine Name",
                      hint: "Add Medicine",
                      controller: medicineNameController,
                    ),
                    const SizedBox(height: 15),
                    CustomContainer(
                      hint: "Instruction",
                      controller: instructionController,
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            DateTimePIcker(),
            SizedBox(height: 30),
            AddMedicineButton(
              onpressed: () {
                if (medicineNameController.text.isNotEmpty) {
                  items.add(medicineNameController.text);
                } else {
                  items.add("Tablet");
                }
                setState(() {
                  Navigator.of(context).pop();
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Center(
                        child: medicineNameController.text.isEmpty
                            ? Text("Tablet")
                            : Text(medicineNameController.text),
                      ),
                      content: const Text(
                          'Your medicine has been successfully added to your reminders.'),
                      actions: <Widget>[
                        Container(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.pop(context, 'Show Medicines'),
                            child: const Text('Show Medicines'),
                          ),
                        ),
                      ],
                    ),
                  );
                  print("added");
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////

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
        const AndroidInitializationSettings('@mipmap/ic_launcher');
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
      'Reminder Notification',
      'This is Time to take ',
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
    return OutlinedButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 31, 99, 131)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: const Color.fromARGB(255, 92, 97, 101), width: 2.0),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        ),
      ),
      onPressed: _selectDateTime,
      child: const Text(
        'Select Date & Time',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
class AddMedicineButton extends StatefulWidget {
  final VoidCallback onpressed;
  const AddMedicineButton({super.key, required this.onpressed});

  @override
  State<AddMedicineButton> createState() => _AddMedicineButtonState();
}

class _AddMedicineButtonState extends State<AddMedicineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // width: MediaQuery.of(context).size.width,
      width: 350,
      decoration: BoxDecoration(
        // color: Colors.amber,
        color: Color.fromARGB(255, 32, 131, 218),
        border: Border.all(color: Color.fromARGB(255, 160, 154, 154), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
          onPressed: widget.onpressed,
          child: Text(
            "Add Medicines",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )),
    );
  }
}

/////////////
class CustomCheckBox extends StatefulWidget {
  final String text;
  const CustomCheckBox({super.key, required this.text});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (newBool) {
                setState(() {
                  isChecked = newBool;
                });
              },
            ),
            // SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomContainer(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 160, 154, 154), width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 19,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

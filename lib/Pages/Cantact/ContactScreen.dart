import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:meditrack/Pages/Cantact/AddContact.dart';
import 'package:meditrack/Pages/Cantact/Contact.dart';
import 'package:meditrack/Screens/BottomNavBar.dart';
import 'package:meditrack/Widgets/CustomTextFeild.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  Uri dialnumber = Uri(scheme: 'tel', path: '7028900431');

  callNumber() async {
    await launchUrl(dialnumber);
  }

  directCall(String number) async {
    await FlutterPhoneDirectCaller.callNumber('${number}');
  }

  List<Contact> contacts = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  textAlign: TextAlign.center, // Center the text and hint text
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0), // Padding inside the TextField
                    border: InputBorder.none, // Remove default border
                    hintText: "Enter Name",
                    hintStyle:
                        TextStyle(color: Colors.grey[600]), // Hint text style
                  ),
                  style: TextStyle(fontSize: 16.0), // Text field text style
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: numberController,
                  // maxLength: 10,
                  textAlign: TextAlign.center, // Center the text and hint text
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Padding inside the TextFieldsd
                    border: InputBorder.none, // Remove default border
                    hintText: "Enter Number",
                    hintStyle:
                        TextStyle(color: Colors.grey[600]), // Hint text style
                  ),
                  style: TextStyle(fontSize: 16.0), // Text field text style
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String number = numberController.text.trim();

                if (name.isNotEmpty && number.isNotEmpty) {
                  setState(() {
                    contacts.add(Contact(name: name, number: number));
                    print("Contact added: $name, $number");
                    nameController.clear();
                    numberController.clear();
                  });
                } else {
                  print("Name or number is empty.");
                }
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent[100],
                side: const BorderSide(
                  color: Colors.white, // Border color
                  width: 2.0, // Border width
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
              ),
              child: const Text(
                "Add Contact",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: const Text("Ambulance",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('***'),
                  leading: const CircleAvatar(
                    child: Text("A"),
                    foregroundColor: const Color.fromARGB(255, 184, 32, 32),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.red,
                    ),
                    onPressed: () => directCall('111'),
                  ),
                ),
              ),
            ),
            // Spacer(),
            Expanded(
              child: contacts.isEmpty
                  ? Text(
                      "No Contacts yet ...",
                      style: TextStyle(fontSize: 20),
                    )
                  : ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Dismissible(
      key: Key(contacts[index].number),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          setState(() {
            nameController.text = contacts[index].name;
            numberController.text = contacts[index].number;
          });
          return false;
        } else if (direction == DismissDirection.endToStart) {
          setState(() {
            contacts.removeAt(index);
            nameController.clear();
            numberController.clear();
          });
          return true;
        }
        return false;
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          title: Text(contacts[index].name,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(contacts[index].number),
          leading: CircleAvatar(
            backgroundColor: index % 2 == 0
                ? Colors.blue
                : const Color.fromARGB(255, 175, 97, 189),
            foregroundColor: Colors.white,
            child: Text(
              contacts[index].name.isNotEmpty
                  ? contacts[index].name[0].toUpperCase()
                  : '?',
              style: TextStyle(color: Colors.white),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.call_outlined),
            onPressed: () => directCall(contacts[index].number.toString()),
          ),
        ),
      ),
    );
  }
}

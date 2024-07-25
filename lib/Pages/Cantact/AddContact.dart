import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditrack/Pages/Cantact/Contact.dart';
import 'package:meditrack/Pages/Cantact/MedicinePage.dart';
import 'package:meditrack/Widgets/CustomTextFeild.dart';
import 'package:permission_handler/permission_handler.dart';

class AddContact extends StatefulWidget {
  final Function(Contact) onContactAdded;
  const AddContact({super.key, required this.onContactAdded});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  /////////////////Logic
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 150, 145, 145),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/doctor.jpg",
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
              ),
              CustomTextField(
                hinttext: "Contact Name",
                textInputType: TextInputType.name,
                controller: nameController,
              ),
              CustomTextField(
                hinttext: "Contact Number",
                // maxLength: 10,
                controller: numberController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  setState(() {
                    String name = nameController.text.trim();
                    String no = numberController.text.trim();

                    if (name.isNotEmpty && no.isNotEmpty) {
                      widget.onContactAdded(Contact(name: name, number: no));
                      // Contact newContact = Contact(name: name, number: no);
                      print("Adding Contat : $name, $no");
                    }

                    Navigator.of(context).pop();
                  });
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  side: const BorderSide(
                    color: Colors.blue, // Border color
                    width: 2.0, // Border width
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
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
            ],
          ),
        ),
      ),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// class AddContacts extends StatefulWidget {
//   const AddContacts({Key? key}) : super(key: key);

//   @override
//   State<AddContacts> createState() => _AddContactsState();
// }

// class _AddContactsState extends State<AddContacts> {
//   List<Map<String, String>> contacts = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchContacts();
//   }

//   void fetchContacts() async {
//     // Simulate fetching contacts
//     await Future.delayed(Duration(seconds: 2));
//     setState(() {
//       contacts = [
//         {'name': 'John Doe', 'phone': '1234567890'},
//         {'name': 'Jane Smith', 'phone': '0987654321'},
//         {'name': 'Alice Johnson', 'phone': '1122334455'},
//       ];
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Contacts"),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: contacts.length,
//               itemBuilder: (context, index) {
//                 final contact = contacts[index];
//                 final name = contact['name'] ?? 'No Name';
//                 final initial = name.isNotEmpty ? name[0] : '?';
//                 final phone = contact['phone'] ?? 'No Number';

//                 return ListTile(
//                   leading: Container(
//                     height: 30,
//                     width: 30,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           blurRadius: 7,
//                           color: Colors.grey,
//                           offset: Offset(-3, -3),
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(6),
//                       color: Colors.blueAccent,
//                     ),
//                     child: Text(initial),
//                   ),
//                   title: Text(
//                     name,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                   subtitle: Text(
//                     phone,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   horizontalTitleGap: 12,
//                 );
//               },
//             ),
//     );
//   }
// }

// class AddContacts extends StatefulWidget {
//   const AddContacts({super.key});

//   @override
//   State<AddContacts> createState() => _AddContactsState();
// }

// class _AddContactsState extends State<AddContacts> {
//   List<Contact> contacts = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getContactPermission();
//   }

//   void getContactPermission() async {
//     if (await Permission.contacts.isGranted) {
//       fetchContacts();
//     } else {
//       await Permission.contacts.request();
//     }
//   }

//   // void fetchContacts() async {
//   //   contacts = await ContactsService.getContacts();

//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }
//   void fetchContacts() async {
//     try {
//       contacts = await ContactsService.getContacts();
//       // Debug print
//       for (var contact in contacts) {
//         print(
//             'Contact: ${contact.displayName}, Given Name: ${contact.givenName}, Phones: ${contact.phones}');
//       }
//     } catch (e) {
//       print('Error fetching contacts: $e');
//       contacts = []; // Ensure contacts is at least an empty list
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Contacts"),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: contacts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Container(
//                     height: 30.h,
//                     width: 30.h,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: 7,
//                             color: Colors.grey,
//                             offset: const Offset(-3, -3)),
//                       ],
//                       borderRadius: BorderRadius.circular(6.r),
//                       color: Colors.blueAccent,
//                     ),
//                     child: Text(
//                       contacts[index].givenName![0],
//                     ),
//                   ),
//                   title: Text(
//                     contacts[index].givenName ?? 'No Name',
//                     // "Contact Name",
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                   ),
//                   subtitle: Text(
//                     // contacts[index].phones![0].value!,
//                     contacts[index].phones?.isNotEmpty == true
//                         ? (contacts[index].phones![0].value ?? "No Number")
//                         : "No Number",
//                     // "232093",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   horizontalTitleGap: 12.w,
//                 );
//               },
//             ),
//     );
//   }
// }
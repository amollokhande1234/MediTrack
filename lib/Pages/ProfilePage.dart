import 'package:flutter/material.dart';

class PatientInfoPage extends StatefulWidget {
  @override
  _PatientInfoPageState createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  Patient? currentPatient;
  final _formKey = GlobalKey<FormState>();

  // Controllers for the form fields
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final medicalHistoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  TextStyle _infoTextStyle() {
    return TextStyle(
      fontSize: 16.0, // Set the font size
      fontWeight: FontWeight.normal, // Set the font weight
      color: Colors.black, // Set the text color
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newPatient = Patient(
        name: nameController.text,
        age: int.tryParse(ageController.text) ?? 0,
        gender: genderController.text,
        phoneNumber: phoneController.text,
        address: addressController.text,
        medicalHistory: medicalHistoryController.text
            .split(',')
            .map((item) => item.trim())
            .toList(),
      );

      setState(() {
        currentPatient = newPatient;
        _clearForm();
        _tabController!.index = 0; // Switch to "For me" tab after submission
      });
    }
  }

  void _editInformation() {
    setState(() {
      nameController.text = currentPatient!.name;
      ageController.text = currentPatient!.age.toString();
      genderController.text = currentPatient!.gender;
      phoneController.text = currentPatient!.phoneNumber;
      addressController.text = currentPatient!.address;
      medicalHistoryController.text = currentPatient!.medicalHistory.join(', ');
      _tabController!.index = 1; // Switch to "Sent" tab for editing
    });
  }

  void _clearForm() {
    nameController.clear();
    ageController.clear();
    genderController.clear();
    phoneController.clear();
    addressController.clear();
    medicalHistoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Information'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 6.0,
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2)),
            insets: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 2),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Change',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // "For me" Tab - Display Patient Information
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: currentPatient != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Patient Information:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 900,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 237, 227, 227),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Name: ${currentPatient!.name}',
                                        style: _infoTextStyle(),
                                      ),
                                      Text(
                                        'Age: ${currentPatient!.age}',
                                        style: _infoTextStyle(),
                                      ),
                                      Text(
                                        'Gender: ${currentPatient!.gender}',
                                        style: _infoTextStyle(),
                                      ),
                                      Text(
                                        'Phone Number: ${currentPatient!.phoneNumber}',
                                        style: _infoTextStyle(),
                                      ),
                                      Text(
                                        'Address: ${currentPatient!.address}',
                                        style: _infoTextStyle(),
                                      ),
                                      Text(
                                        'Medical History: ${currentPatient!.medicalHistory.join(', ')}',
                                        style: _infoTextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: _editInformation,
                          child: Text('Edit Information'),
                        ),
                      ),
                    ],
                  )
                : Center(child: Text('No patient information available')),
          ),

          // "Sent" Tab - Form to Add/Edit Patient Information
          Container(
            // color: Colors.amber,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Patient Information:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: ageController,
                        decoration: InputDecoration(labelText: 'Age'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an age';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: genderController,
                        decoration: InputDecoration(labelText: 'Gender'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a gender';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(labelText: 'Address'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: medicalHistoryController,
                        decoration: InputDecoration(
                            labelText: 'Medical History (comma separated)'),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Patient {
  String name;
  int age;
  String gender;
  String phoneNumber;
  String address;
  List<String> medicalHistory;

  Patient({
    required this.name,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.address,
    required this.medicalHistory,
  });
}

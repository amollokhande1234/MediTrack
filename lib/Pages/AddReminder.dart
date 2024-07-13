import 'package:flutter/material.dart';

class AddReminderPage extends StatelessWidget {
  const AddReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.lightGreen,
        backgroundColor: Color.fromARGB(255, 7, 62, 87),
        title: Text(
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
                    SizedBox(height: 10),
                    CustomContainer(hint: "Medicine Name"),
                    SizedBox(height: 15),
                    CustomContainer(hint: "Instruction"),
                    SizedBox(height: 25),
                    Container(
                      width: 350,
                      height: 230,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 160, 154, 154),
                            width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          // CheckBox Column
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Check BOx
                                CustomCheckBox(
                                  text: "Daily",
                                ),
                                CustomCheckBox(
                                  text: "Monthly",
                                ),
                                CustomCheckBox(
                                  text: "Weekly",
                                ),
                                CustomCheckBox(
                                  text: "Alternative",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          VerticalDivider(
                            color: Colors.grey, // The color of the divider
                            thickness: 1, // The thickness of the divider
                            width: 20, // The width of the divider
                            indent:
                                8, // Empty space to the leading edge of the divider
                            endIndent:
                                8, // Empty space to the trailing edge of the divider
                          ),
                          SizedBox(width: 10),
                          // Date
                          Column(
                            children: [
                              // Buttons
                              DateButton(text: "Date"),
                              SizedBox(height: 20),
                              TimeButton(text: "Time"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            AddMedicineButton(),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////

class AddMedicineButton extends StatefulWidget {
  const AddMedicineButton({super.key});

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
          onPressed: () {},
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

// Date Button
class DateButton extends StatefulWidget {
  final String text;
  const DateButton({super.key, required this.text});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  DateTime? _selectDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 100,
        height: 80,
        // color: Colors.amber,
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                );
                if (datePicked != null) {
                  setState(() {
                    _selectDate = datePicked;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(100, 20),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                padding:
                    EdgeInsets.symmetric(vertical: 5.0), // Vertical padding
                textStyle: TextStyle(fontSize: 16), // Text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
              child: Text(widget.text),
            ),
            SizedBox(height: 5),
            Text(
              _selectDate != null
                  ? '${_selectDate?.day}/${_selectDate?.month}/${_selectDate?.year}'
                  : 'dd/mm/yyyy',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

// Time Button
class TimeButton extends StatefulWidget {
  final String text;
  const TimeButton({super.key, required this.text});

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  TimeOfDay? _selectTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: 100,
        height: 80,
        // color: Colors.amber,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (pickedTime != null) {
                  setState(() {
                    _selectTime = pickedTime;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(100, 30),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                padding: EdgeInsets.symmetric(vertical: .0), // Vertical padding
                textStyle: TextStyle(fontSize: 16), // Text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
              child: Text(widget.text),
            ),
            Text(
              _selectTime != null
                  ? "${_selectTime?.minute}:${_selectTime?.hour}"
                  : "mm : yy",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
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

  // late String _text;

  // @override
  // void initState() {
  //   super.initState();
  //   _text = widget.text;
  // }

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
  const CustomContainer({super.key, required this.hint});

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

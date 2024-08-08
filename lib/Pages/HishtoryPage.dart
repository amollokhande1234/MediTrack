import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          HishtoryMedicines(
            table: "",
          ),
        ],
      )),
    );
  }
}

class HishtoryMedicines extends StatelessWidget {
  final String table;
  const HishtoryMedicines({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      color: Colors.amber,
      child: Column(
        children: [Text("Medicine Name"), Text("Time")],
      ),
    );
  }
}

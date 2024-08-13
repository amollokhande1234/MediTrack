import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';

class HishtoryMedicines extends StatelessWidget {
  final List _hishtoryItems;
  HishtoryMedicines(this._hishtoryItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hishtory"),
        centerTitle: true,
        // foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple[100],
      ),
      body: ListView.builder(
        itemCount: _hishtoryItems.length,
        // reverse: true,
        itemBuilder: (context, index) {
          index = _hishtoryItems.length - 1 - index;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 90,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    '${_hishtoryItems[index]['name']} }',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Taken Time : ${_hishtoryItems[index]['date']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

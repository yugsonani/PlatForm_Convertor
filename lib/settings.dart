import 'package:flutter/material.dart';

import 'global.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                Global.selDate,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030));
                setState(() {
                  Global.selDate =
                      ("${currentDate.day}/${currentDate.month}/${currentDate.year}");
                });
              },
              child: Text(
                "Change Date",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time:',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                "${Global.selTime}",
                style: TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                TimeOfDay? res = await showTimePicker(
                  context: context,
                  initialTime: currentTime,
                );
                setState(() {
                  Global.selTime =
                      ("${res!.hour}:${res.minute} ${res.period.name}");
                });
              },
              child: Text(
                "Change Time",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

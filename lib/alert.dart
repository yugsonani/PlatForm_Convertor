import 'package:flutter/material.dart';

import 'global.dart';

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        // height: 450,
        width: 400,
        child: Stepper(
            controlsBuilder: (context, _) {
              return Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (Global.index < 2) {
                            Global.index++;
                          }
                        });
                      },
                      child:
                          (Global.index == 2) ? Text("Add") : Text("Continue")),
                  (Global.index != 0)
                      ? OutlinedButton(
                          onPressed: () {
                            setState(() {
                              if (Global.index > 0) {
                                Global.index--;
                              }
                            });
                          },
                          child: Text("Cancel"))
                      : Container()
                ],
              );
            },
            currentStep: Global.index,
            steps: Global.step
                .map((e) => Step(
                    title: Text("${e['title']}"),
                    subtitle: Text("${e['subTitle']}"),
                    content: e['content']))
                .toList()),
      ),
    );
  }
}

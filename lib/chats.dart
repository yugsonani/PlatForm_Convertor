import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'global.dart';

class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
          children: Global.contacts
              .map(
                (e) => Card(
                  elevation: 0,
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          context: context,
                          builder: (context) {
                            return BottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25))),
                                onClosing: () {},
                                builder: (context) {
                                  return Container(
                                    height: 300,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 80,
                                          backgroundImage:
                                              AssetImage("${e['imeg']}"),
                                          backgroundColor: Colors.grey,
                                        ),
                                        Text("${e['name']}"),
                                        Text("${e['contact']}"),
                                        ElevatedButton(
                                            onPressed: () {
                                              Share.share("${e['name']}");
                                              Share.share("${e['contact']}");
                                            },
                                            child: Text("Share Contact")),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cncel")),
                                      ],
                                    ),
                                  );
                                });
                          });
                    },
                    leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('${e['imeg']}')),
                    title: Text("${e['name']}"),
                    subtitle: Text("${e['subtitle']}"),
                    trailing: Text("${e['time']}"),
                  ),
                ),
              )
              .toList()),
    );
  }
}

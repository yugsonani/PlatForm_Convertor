import 'package:flutter/material.dart';
import 'global.dart';
import 'package:url_launcher/url_launcher.dart';

class calls extends StatefulWidget {
  const calls({Key? key}) : super(key: key);

  @override
  State<calls> createState() => _callsState();
}

class _callsState extends State<calls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
          children: Global.contacts.map((e) => Card(
            elevation: 0,
            child: ListTile(
              onTap: (){},
              leading: CircleAvatar(radius:40,backgroundImage: AssetImage('${e['imeg']}')),
              title: Text("${e['name']}"),
              subtitle: Text("${e['time']}"),
              trailing: IconButton(
                onPressed: (){
                  final Uri url = Uri.parse('tel:${e['contact']}');
                  launchUrl(url);
                },
                color: Colors.green,
                icon: Icon(Icons.call),

              ),

            ),
          ),
          ).toList()
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void showScratchpad(BuildContext context) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Scratchpad'),
          backgroundColor: Colors.yellow,
          content: Container(
            width: double.minPositive,
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: scratchpad.credentials.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = scratchpad.credentials.keys.elementAt(index);
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("${key}:"),
                        subtitle: Text("pwd: ${scratchpad.credentials[key]['pwd']}\n"
                            "hash: ${scratchpad.credentials[key]['hash']}\n"
                            "other: ${scratchpad.credentials[key]['other']}"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
  );
}
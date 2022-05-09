import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_1/show_challenges_menu.dart';
import 'package:game_1/show_monitor.dart';
import 'package:game_1/show_scratchpad.dart';

import 'main.dart';

void showMenu(BuildContext context, challenges) {
  const TextStyle text_style = TextStyle(color: Colors.black, fontSize: 18.0);
  
  showDialog(
    context: context,
    builder: (_) {
      return SimpleDialog(
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        children: [
          SimpleDialogOption(
            child: const Text('View Challenges', style: text_style),
            onPressed: () {
              showChallenges(context, challenges);
              print('You have selected to View Challenges');
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Show Scratchpad', style: text_style),
            onPressed: () {
              showScratchpad(context);
            },
          ),
          SimpleDialogOption(
            child: const Text('Login at Workstation', style: text_style),
            onPressed: () {
              showMonitor(context);
            },
          ),
          SimpleDialogOption(
            child: const Text('Close Menu', style: text_style),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Quit Game', style: text_style),
            onPressed: () {
              SystemNavigator.pop();
            },
          )
        ],
      );
    },
  );
}
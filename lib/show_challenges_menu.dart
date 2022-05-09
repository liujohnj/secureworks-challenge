import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_1/show_challenges_menu.dart';
import 'challenges.dart';

import 'main.dart';

void showChallenges(BuildContext context, challenges) {
  const colorChallengeText = Colors.black;
  const TextStyle text_style = TextStyle(color: Colors.black, fontSize: 18.0);
  
  showDialog(
    context: context,
    builder: (_) {
     String X_logout_laziness = "[  ]  ";
     String X_brute_raise = "[  ]  ";
     String X_sticky_note = "[  ]  ";
     String X_ripped_hash = "[  ]  ";
     String X_compromise_park = "[  ]  ";

     if (challenges.logout_laziness == true) {
       X_logout_laziness = "[X]  ";
     }
     if (challenges.brute_raise == true) {
       X_brute_raise = "[X]  ";
     }
     if (challenges.sticky_note == true) {
       X_sticky_note = "[X]  ";
     }
     if (challenges.ripped_hash == true) {
       X_ripped_hash = "[X]  ";
     }
     if (challenges.compromise_park == true) {
       X_compromise_park = "[X]  ";
     }
     
      return SimpleDialog(
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.tealAccent,
        children: [
          SimpleDialogOption(
            child: Text(X_logout_laziness + "Identify logout laziness", style: text_style),
            onPressed: () {
              //showChallenges(context, challenges);
              print('Logout laziness');
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_brute_raise + 'Be a brute & give yourself a raise', style: text_style),
            onPressed: () {
              // Do something
              //print('Brute force');
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_sticky_note + 'Sticky note no-no', style: text_style),
            onPressed: () {
              // Do something
              // Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_ripped_hash + 'Serve up John the Ripper some hash', style: text_style),
            onPressed: () {
              // Do something
              //print('John the Ripper');
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_compromise_park + 'Compromise in the park :)', style: text_style),
            onPressed: () {
              //print('Compromise in the park');
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Close', style: text_style),
            onPressed: () {
              // Do something
              //print('You have selected to close');
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
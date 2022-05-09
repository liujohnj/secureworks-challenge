import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_as_other.dart';
import 'main.dart';

void showLoginAttempt(BuildContext context, String username) {
  print("Login attempted");
  late bool has_pwd;
  late bool has_hash;
  scratchpad.credentials[username]['pwd'] == 'n/a'? has_pwd = false : has_pwd = true;
  scratchpad.credentials[username]['hash'] == 'n/a'? has_hash = false : has_hash = true;
  String other = scratchpad.credentials[username]['other'];
  print("${username} : ${has_pwd} : ${has_hash}");

  String text_string = '';
  bool can_proceed = false;

  if (has_pwd) {
    text_string = "You have ${username}\'s plain text password in your "
        "Scratchpad.\n\nClick Proceed to log in as ${username}.";
    can_proceed = true;
  } else if (has_hash) {
    text_string = "You have ${username}\'s encrypted (hashed) password in your "
        "Scratchpad.\n\nClick Proceed to run a dictionary attack using the John "
        "the Ripper password cracking tool.";
    can_proceed = true;
  } else if (other == 'Password is 4 lowercase letters.') {
    text_string = "${username}\'s password is only 4 lowercase letters.\n\nClick "
        "Proceed to perform an automated brute force attack.\n\nThere are only "
        "456,976 possible combinations. It should take no time at all.";
    can_proceed = true;
  } else {
    text_string = "You do not have ${username}\'s plain password or hashed "
        "password.";
  };

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Login Attempt Status'),
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text_string),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Proceed'),
                onPressed: () {
                  if (can_proceed) {
                    loginAsOther(context, username);
                  }
                }
              ),
              TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              ),
            ],
        );
      }
  );
}
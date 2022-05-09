import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void loginAsOther(BuildContext context, String username) {
  String text_string = '';

  if (username == 'Grace') {
    text_string = "You successfully have logged in as Grace and given yourself a "
        "raise.\n\nCongratulations on completing one of the challenges!";
    challenges.brute_raise = true;
    scratchpad.credentials['Grace']['pwd'] = 'asdf';
  } else if (username == 'Craig') {
    text_string = "You successfully have logged in as Craig and obtained "
      "login credentials for all employees. These credentials are comprised "
      "of usernames and passwords encrypted (hashed) with SHA256, and all these "
      "password hashes have now been "
      "added to your Scratchpad.\n\nYou can now use a program like John the "
      "Ripper to see if any of these hashes appear in dictionaries containing "
      "millions of previously cracked passwords.\n\nHopefully, they don't "
      "have two-factor authentication enabled, though.";
    scratchpad.credentials['Alice']['hash'] =
    'AE569263510ECA08663C5FA4AAE960A09DFB61C69196F2EE2ABBB2BC3F8B6AC5';
    scratchpad.credentials['Bob']['hash'] =
    'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F';
    scratchpad.credentials['Craig']['hash'] =
    '095F5255EC709F24E37166A0BA569B1A5E464E83B52F3169628EC67AA8677C17';
    scratchpad.credentials['Eve']['hash'] =
    '49987A201099AF51CF664B6013AD3ACEB1E2D65628762688751AC753C59CF32C';
    scratchpad.credentials['Grace']['hash'] =
    'F0E4C2F76C58916EC258F246851BEA091D14D4247A2FC3E18694461B1816E13B';
    scratchpad.credentials['Olivia']['hash'] =
    'B2D1349EA3F52597F37566ED4095E10729C8329C612B64563849DCF29EE9DE6E';
  } else if (username == 'Olivia') {
    text_string = "The dictionary attack worked because someone else in the "
        "past has used the same password and now this hash appears in a "
        "dictionary somewhere.\n\nYou successfully have logged in as Olivia."
        "\n\nYou see in Olivia\'s to-do list a reminder to steal more confidential "
        "files for the competition!\n\nCongratulations! You solved a challenge!";
    scratchpad.credentials['Olivia']['other'] =
    "Intruder stealing confidential information.";
    challenges.ripped_hash = true;
  } else if (username == 'Eve') {
    text_string = "The dictionary attack worked because someone else in the "
        "past has used the same password and now this hash appears in a "
        "dictionary somewhere.\n\nUnfortunately, though, Eve has two-factor "
        "authentication enabled and so you cannot login as Eve.";
  } else if (username == 'Bob') {
    text_string = "The dictionary attack was not successful.\n\nThe password Bob "
        "has chosen does not appear in a dictionary of previously cracked passwords.";
  } else if (username == 'Alice') {
    text_string = "The dictionary attack was not successful.\n\nThe password Alice "
        "has chosen does not appear in a dictionary of previously cracked passwords.";
  };

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login status', style: TextStyle(color: Colors.green)),
          backgroundColor: Colors.black,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text_string, style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Close', style: TextStyle(color: Colors.green)),
                onPressed: () {
                    Navigator.of(context).pop();
                }
            ),
          ],
        );
      }
  );
}
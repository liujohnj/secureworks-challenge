import 'package:flutter/material.dart';
import 'package:game_1/show_login_attempt.dart';

void showMonitor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;    // screen width
  double height = MediaQuery.of(context).size.height;    // screen height

  showDialog(
    context: context,
    builder: (context) {
      String dropdownValue = 'Alice';
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            insetPadding: EdgeInsets.all(10),
            title: Text(
                "Employee Login Page",
                style: TextStyle(color: Colors.green, fontSize: 28.0)),
            backgroundColor: Colors.black,
            content: Column(
              children: <Widget>[
                Container(
                  width: width * 0.5,
                  height: 20,
                ),
                DropdownButton(
                  dropdownColor: Colors.black38,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward, color: Colors.green),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 24.0),
                  underline: Container(
                    height: 2,
                    color: Colors.green,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Alice', 'Bob', 'Eve', 'Craig', 'Grace', 'Olivia']
                      .map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                /*
                Container(
                  width: width * 0.35,
                  child: const TextField(
                    readOnly: true,
                    obscureText: true,
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0)
                      ),
                      hintText: 'password',
                      hintStyle: TextStyle(color: Colors.green, fontSize: 18.0),
                      isDense: true,
                    )
                  )
                ),
                */
                TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                      const Text("password", textAlign: TextAlign.left),
                  ),
                    style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.transparent,
                    //minimumSize: Size(width * 0.35, 50),
                    maximumSize: Size(width * 0.35, 50),
                    //padding: 20.0,
                    side: BorderSide(color: Colors.green, width: 1.0),
                    textStyle:
                      const TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    print("employee is ${dropdownValue}");
                    showLoginAttempt(context, dropdownValue);

                    //Navigator.of(context).pop();
                  }
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextButton(
                    child: const Text("Login"),
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.green,
                        textStyle:
                        const TextStyle(fontSize: 20.0)
                    ),
                    onPressed: () {
                      //Navigator.of(context).pop();
                    }
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
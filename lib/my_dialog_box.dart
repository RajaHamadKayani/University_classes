import 'package:api_practice/navigation_drawer.dart';
import 'package:api_practice/navigation_drawer_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogBox extends StatefulWidget {
  const MyDialogBox({super.key});

  @override
  State<MyDialogBox> createState() => _MyDialogBoxState();
}

class _MyDialogBoxState extends State<MyDialogBox> {
  myDialogBoxFunction(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Navigate to Next"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Are you sure want to navigate?"),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.red),
                        child: Center(
                          child: Text("Cancel"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NavigationDarwer1()));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Center(
                          child: Text("Navigate"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            myDialogBoxFunction(context);
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: const BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("Click here"),
            ),
          ),
        ),
      ),
    );
  }
}

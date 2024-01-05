import 'package:api_practice/my_get_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxExample extends StatefulWidget {
  const GetxExample({super.key});

  @override
  State<GetxExample> createState() => _GetxExampleState();
}

class _GetxExampleState extends State<GetxExample> {
  MyGetController myGetController = Get.put(MyGetController());
  int counter = 0;
  void incrementCounter() {
    counter = counter + 1;
  }

  myDialogBox(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Increment counter"),
            content: Column(
              children: [
                Text("Are you sure want to increment"),
                const SizedBox(
                  height: 30,
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
                        decoration:const BoxDecoration(color: Colors.red),
                        child: const Center(
                          child: Text("Cancel"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        myGetController.incrementCounter();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Center(
                          child: Text("Increment"),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("My tree rebuilds");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("My Appbar"),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("My name is hamad"),
            const Text("I am a flutter junior developer"),
            Obx(() {
              return Text("Counter: ${myGetController.counter.value}");
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myDialogBox(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:api_practice/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyExample extends StatefulWidget {
  const MyExample({super.key});

  @override
  State<MyExample> createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
  Controller myController = Get.put(Controller());
  int counter = 0;
  void incrementValue() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    print("My whole tree rebuilds");
    return Scaffold(
      appBar: AppBar(
        title: const Text("My My App"),
        leading: const Icon(Icons.menu),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("kdnvkdnv"),
            const Text("ksnvskvnkvnv"),
            const SizedBox(
              height: 30,
            ),
      
               Text("Counter:$counter "),
          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            incrementValue();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

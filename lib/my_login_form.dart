import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  String? name;
  @override
  void initState() {
    super.initState();
    loginApiMethod();
  }

  List<dynamic> list = [];
  Future<List<dynamic>> loginApiMethod() async {
    final response = await http.get(Uri.parse(
        "https://reqres.in/api/login?email=eve.holt@reqres.in&password=cityslicka"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      list = data["data"];
      print(list);
      name = list[0]["name"];
      print(list[0]["name"]);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Successful")));
      print(response.statusCode);
    } else {
      print("status code is ${response.statusCode}");
    }
    return list;
  }

  TextEditingController controller = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter email",
              ),
            ),
            TextFormField(
              controller: controllerPassword,
              decoration: InputDecoration(
                hintText: "Enter email",
              ),
            ),
            InkWell(
              onTap: () async {
                await loginApiMethod();
              },
              child: const Text("Sign in"),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 1,
                child: FutureBuilder(
                  future: loginApiMethod(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 30,
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data![index]['name'],
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      snapshot.data![index]['year'].toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      snapshot.data![index]['color'].toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ))
          ],
        ),
      ),
    );
  }
}

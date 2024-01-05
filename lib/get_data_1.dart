import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData1 extends StatefulWidget {
  const GetData1({super.key});

  @override
  State<GetData1> createState() => _GetData1State();
}

class _GetData1State extends State<GetData1> {
  @override
  void initState() {
    super.initState();
    GetData1(context);
  }

  List<dynamic> list = [];
  Future<List<dynamic>> GetData1(BuildContext context) async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      list = jsonDecode(response.body.toString());
      String title = list[0]["address"]["zipcode"];
      print(title);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: GetData1(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  );
                } else {
                  return Expanded(
                    flex: 1,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                decoration:
                                    const BoxDecoration(color: Colors.teal),
                                child: ListTile(
                                  subtitle: Text(snapshot.data![index]
                                      ["address"]["geo"]["lat"]),
                                  title: Text(
                                    snapshot.data![index]["address"]["street"],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
        ],
      ),
    );
  }
}

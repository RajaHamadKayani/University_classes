import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetApiData extends StatefulWidget {
  const GetApiData({super.key});

  @override
  State<GetApiData> createState() => _GetApiDataState();
}

class _GetApiDataState extends State<GetApiData> {
  @override
  void initState() {
    super.initState();
    getApiData();
  }

  List<dynamic> list = [];
  Future<List<dynamic>> getApiData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      list = jsonDecode(response.body.toString());
      print(list);
    } else {
      print(response.statusCode);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getApiData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding:const EdgeInsets.only(bottom: 20),
                    child: ClipRRect(
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.teal),
                        child: ListTile(
                          title: Text(
                            snapshot.data![index]["title"],
                            style:const TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            snapshot.data![index]["body"],
                            style:const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }
          }),
    );
  }
}

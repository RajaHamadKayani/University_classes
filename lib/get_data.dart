import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List<dynamic> getDataList = [];
  @override
  void initState() {
    super.initState();
    getDataFunction(context);
  }

  Future<List<dynamic>> getDataFunction(BuildContext context) async {
    List<dynamic> data;

    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      getDataList = data;
      print(getDataList[0]['title']);
    }
    return getDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDataFunction(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else {
            return ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal),
                    child: ListTile(
                      title: Text(
                        snapshot.data![index]["title"],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              );
            });
          }
        },
      ),
    );
  }
}

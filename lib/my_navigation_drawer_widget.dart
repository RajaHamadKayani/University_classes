import 'package:flutter/material.dart';

class MyDavigationDrawerWdget extends StatelessWidget {
  int? color;
  double? height;
  double? width;
  List<String> title = ["Home", "Person", "Menu", "Settings"];
  List<IconData> icon = [Icons.home, Icons.person, Icons.menu, Icons.settings];
  MyDavigationDrawerWdget({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.0,
      width: width ?? 0.0,
      decoration: BoxDecoration(color: Color(color ?? 0)),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: title.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return Padding(
                  padding:const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Card(
                        child: ListTile(
                          title: Text(
                            title[index],
                            style:const TextStyle(color: Colors.black),
                          ),
                          leading: Icon(icon[index]),
                        ),
                      ),
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}

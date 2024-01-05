import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  double? drawerHeight;
  double? drawerWidth;
  int? color;
  List<String> title = ["Person", "Home", "Settings", "Menu"];
  List<IconData> icon = [Icons.person, Icons.home, Icons.settings, Icons.menu];
  DrawerComponent({super.key, this.drawerHeight, this.color,this.drawerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: drawerHeight ?? 0.0,
      width: drawerWidth ?? 0.0,
      decoration: BoxDecoration(
        color: Color(color ?? 0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
              child: SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Card(
                          child: ListTile(
                            title: Text(
                              title[index].toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            leading: Icon(
                              icon[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}

import 'package:api_practice/drawer_component.dart';
import 'package:api_practice/responsive_layout.dart';
import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: !ResponsiveLayout.isDesktop(context) &&
              !ResponsiveLayout.isTablet(context)
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    globalKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            )
          : null,
      drawer: !ResponsiveLayout.isDesktop(context) &&
              !ResponsiveLayout.isTablet(context)
          ? Drawer(
              backgroundColor: Colors.white,
              child: DrawerComponent(
                drawerHeight: MediaQuery.of(context).size.height,
                drawerWidth: 300,
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (!ResponsiveLayout.isMobile(context))
                  DrawerComponent(
                    drawerHeight: MediaQuery.of(context).size.height,
                    drawerWidth: 300,
                    color: 0xff000000,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

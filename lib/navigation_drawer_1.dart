import 'package:api_practice/my_navigation_drawer_widget.dart';
import 'package:api_practice/responsive_layout.dart';
import 'package:flutter/material.dart';

class NavigationDarwer1 extends StatefulWidget {
  const NavigationDarwer1({super.key});

  @override
  State<NavigationDarwer1> createState() => _NavigationDarwer1State();
}

class _NavigationDarwer1State extends State<NavigationDarwer1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: !ResponsiveLayout.isDesktop(context) &&
              !ResponsiveLayout.isTablet(context)
          ? AppBar(
              backgroundColor: Colors.blue,
              leading: IconButton(
                  onPressed: () {
                    globalKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            )
          : null,
      drawer: Drawer(
        child: MyDavigationDrawerWdget(
          height: MediaQuery.of(context).size.height,
          width: 300,
          color: 0xff000000,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                if (!ResponsiveLayout.isMobile(context))
                  MyDavigationDrawerWdget(
                    color: 0xff000000,
                    height: MediaQuery.of(context).size.height,
                    width: 300,
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 20,
                    width: !ResponsiveLayout.isDesktop(context) &&
                            !ResponsiveLayout.isTablet(context)
                        ? MediaQuery.of(context).size.width - 20
                        : MediaQuery.of(context).size.width - 320,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

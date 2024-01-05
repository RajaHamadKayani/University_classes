import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  List<Widget> screenList = [
    const HomeScreen(),
    const PersonScreen(),
    const SettingsScreen(),
    const MenuScreen()
  ];
  int initilIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[initilIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initilIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home ",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
        ],
        onTap: (index) {
          setState(() {
            initilIndex = index;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            "Home Screen",
            style: TextStyle(color: Colors.black),
          ),
          Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.red))
        ]),
      ),
    );
  }
}

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            "Home Screen",
            style: TextStyle(color: Colors.black),
          ),
          Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.red))
        ]),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            "Home Screen",
            style: TextStyle(color: Colors.black),
          ),
          Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.red))
        ]),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            "Menu screen",
            style: TextStyle(color: Colors.black),
          ),
          Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.red))
        ]),
      ),
    );
  }
}

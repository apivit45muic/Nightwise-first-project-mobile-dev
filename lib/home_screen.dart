import 'package:flutter/material.dart';

import 'package:firstproject/alarm.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; //default = Alarm

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO add more tabs here
    final List<Widget> tabs = [AlarmScreen()];
    final List<String> titles = ["Alarm"];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex],
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        ),
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int i) {
        setState(() {
          _selectedIndex = i;
        });
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "HOME", ), //will add changable icon if alarm was set later.
      BottomNavigationBarItem(icon: Icon(Icons.history), label: "HISTORY"),
      BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: "PROFILE"),
    ],
    ),
    body: tabs[_selectedIndex],
    );
  }
}

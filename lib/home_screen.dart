import 'package:firstproject/profile.dart';
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
    final List<Widget> tabs = [AlarmScreen(), ProfileScreen(), ProfileScreen()];
    final List<String> titles = ["Alarm", "History","Profile"];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex],
        style: Theme.of(context).textTheme.headline3
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
      BottomNavigationBarItem(icon: Icon(Icons.alarm, size:40), label: "HOME", ), //will add changable icon if alarm was set later.
      BottomNavigationBarItem(icon: Icon(Icons.history, size:40), label: "HISTORY"),
      BottomNavigationBarItem(icon: Icon(Icons.person_sharp, size:40), label: "PROFILE"),
    ],
    ),
    body: tabs[_selectedIndex],
    );
  }
}

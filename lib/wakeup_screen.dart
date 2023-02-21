import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WakeUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WakeUpScreen();
}

class _WakeUpScreen extends State<WakeUpScreen> {
  int sleepDuration = 0;

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? sleepTime = prefs.getInt("sleepTime");
    int? alarmTime = prefs.getInt("alarm");
    int duration = alarmTime! - sleepTime!;
    setState(() {
      sleepDuration = (duration/1000).round();
    });
    }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
          "You have slept: $sleepDuration",
          style:
          TextStyle(color: Theme
              .of(context)
              .primaryColor, fontSize: 30),
        ),
        SizedBox(
          height: 20,
        ),
        ]
        ),
      ),
    );
  }
}
import 'package:alarm/alarm.dart';
import 'package:firstproject/home_screen.dart';
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
    final _stopButton = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.red,
      ),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.37,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          final stop = await Alarm.stop();
          setState(() {
            Navigator.pop(context);
            Navigator.pop(context);
          });
        },
        child: Text("Stop",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            )
        ),
      ),
    );

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
          _stopButton
        ]
        ),
      ),
    );
  }
}
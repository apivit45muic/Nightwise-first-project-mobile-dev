import 'package:audioplayers/audioplayers.dart';
import 'package:firstproject/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
//https://api.flutter.dev/flutter/cupertino/CupertinoDatePicker-class.html

class AlarmScreen extends StatefulWidget {
  AlarmScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmTabState();
}
class _AlarmTabState extends State<AlarmScreen> {
  late DateTime _selectedDate;

  @override
  void initState(){
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> Update() async{
    int timestamp = _selectedDate.millisecondsSinceEpoch;
    int timeNow = DateTime.now().millisecondsSinceEpoch-1;
    if (timestamp < timeNow){
      //make timestamp += tommorow
      timestamp += 1000 * 60 * 60 * 24;
    }
    //TODO await
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("alarm", timestamp);
    prefs.setInt("sleepTime", timeNow);
    //for debug
    print("timestamp : $timestamp");
    // print("timestamp : $_selectedDate");
    print("timeNow :${DateTime.now()}"); //https://currentmillis.com/
  }

  @override
  Widget build(BuildContext context) {
    final startButton = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.blueGrey[400],
        ),
        child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.37,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            Update();
            Navigator.push(context,
              PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => SleepingScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    return SlideTransition(
                  position: animation.drive(tween),
                child: child,
              );
            },
          ));
          });
        },
          child: const Text("Start",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )
          ),
        ),
    );
    final datePicker = Container(
        height: 160,
        width: 200,
        child : CupertinoTheme(
          data: CupertinoThemeData(
            brightness: Brightness.dark,
          ),
            child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onDateTimeChanged: (date) {
              _selectedDate = date;
              },
            ),
        )
      );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
              datePicker,
              SizedBox(height: 50,), //space between datePicker and start button
              startButton,
            ],
          ),
        );
      }
    }
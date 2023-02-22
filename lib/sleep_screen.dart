import 'dart:async';
import 'dart:math';

import 'util.dart';

import 'package:quiver/async.dart';
import 'package:firstproject/wakeup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

/*
  The screen user sees when sleeping.
 */
class SleepingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SleepingScreenState();
}

class _SleepingScreenState extends State<SleepingScreen> {
  late int _alarmTimestamp, _timeLeft;
  String _soundName = "Nature sound 1";
  late StreamSubscription _sub;

  void setUp() async {
    // Setup preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _alarmTimestamp =
        prefs.getInt("alarm") ?? DateTime.now().millisecondsSinceEpoch;
    _soundName = prefs.getString("sound") ?? "Nature sound 1";

    // Setup timer
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    int timeLeft = _alarmTimestamp - currentTimestamp;
    print(timeLeft);
    CountdownTimer countdownTimer =
    CountdownTimer(Duration(milliseconds: timeLeft), Duration(seconds: 1));
    _sub = countdownTimer.listen(null);
    _sub.onData((duration) {
      timeLeft -= 1000;
      onTimerTick(timeLeft);
      print('Counting down: $timeLeft');
    });

    _sub.onDone(() {
      print("Done.");
      _sub.cancel();
      // Transition to wake up page.
      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => WakeUpScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          )
      );
    });
  }
      void onTimerTick(int newTimestamp) {
        setState(() {
          _timeLeft = newTimestamp;
        });
      }


      @override
      void initState() {
        super.initState();
        _timeLeft = 0;
        setUp();
      }

      @override
      Widget build(BuildContext context) {
        final _cancelButton = Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.blueGrey[400],
          ),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.37,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Text("Cancel",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
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
                    "Time until wake up:",
                    style:
                    TextStyle(color: Theme
                        .of(context)
                        .primaryColor, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      formatHHMMSS((_timeLeft/1000).round()),
                    style: TextStyle(
                      color: Color.fromARGB(
                          255,
                          (120 * cos(_timeLeft / 1000)).round() + 126,
                          130,
                          (120 * sin(_timeLeft / 1000)).round() + 126),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.8,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  _cancelButton,
                ],
              )
          ),
        );
      }
  }

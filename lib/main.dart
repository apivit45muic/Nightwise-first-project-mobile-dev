import 'package:flutter/material.dart';

import 'alarm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // we can omit this (as it is by default anyway)
      routes: {
        '/': (context) => const AlarmScreen(),
        '/timedetail': (context) => const TimeSelectScreen(),
        '/seatdetail': (context) => const SeatSelectScreen(),
        '/comingsoon': (context) => const ComingSoonScreen(),
        '/trailer': (context) => const TrailerScreen(),
      },
    );
  }
}
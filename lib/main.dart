import 'package:flutter/material.dart';

import 'alarm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first-project',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        bottomAppBarColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        fontFamily: 'Georgia', colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purpleAccent[400]),
      ),
      initialRoute: '/', // we can omit this (as it is by default anyway)
      routes: {
        '/': (context) => AlarmScreen(),
        // '/timedetail': (context) => const TimeSelectScreen(),
        // '/seatdetail': (context) => const SeatSelectScreen(),
        // '/comingsoon': (context) => const ComingSoonScreen(),
        // '/trailer': (context) => const TrailerScreen(),
      },
    );
  }
}
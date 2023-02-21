import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statistic',
      home: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
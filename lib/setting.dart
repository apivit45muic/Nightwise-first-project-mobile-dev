import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setting',
      home: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
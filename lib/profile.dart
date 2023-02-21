import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        body: Container(
          color: Theme.of(context).bottomAppBarColor,
        ),
      ),
    );
  }
}
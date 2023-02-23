import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  //returns the current theme data based on the isDarkMode property.
  ThemeData get themeData => isDarkMode ? darkTheme : lightTheme;

  // changes the isDarkMode property and notifies listeners of the change.
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blueGrey[800],
    bottomAppBarColor: Colors.blueGrey[400],
    scaffoldBackgroundColor: Colors.blueGrey[300],
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black, tertiary: Colors.white),
    fontFamily: 'Georgia',
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.blueGrey[400],
  bottomAppBarColor: Colors.blueGrey[800],
  scaffoldBackgroundColor: Colors.blueGrey[900],
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white,tertiary: Colors.blueAccent),
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline3: TextStyle(color: Colors.white),
    ),
  );
}
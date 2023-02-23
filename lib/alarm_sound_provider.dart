import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///store or get alarm sound settings using SharedPreferences.
class AlarmSoundProvider extends ChangeNotifier {
  String _selectedSound = "digital";
  List<String> _soundOptions = ["digital", "loudbell", "towerbell"];
  late SharedPreferences _preferences;

  List<String> get soundOptions => _soundOptions;
  String getSelectedSound() => _selectedSound;

  AlarmSoundProvider(Future<SharedPreferences> preferencesFuture) {
    // Wait for the preferences to be retrieved before continuing
    preferencesFuture.then((prefs) {
      _preferences = prefs;
      _selectedSound = _preferences.getString("selectedSound") ?? "Default Sound";
      notifyListeners();
    });
  }

  void setSelectedSound(String soundOption) {
    _selectedSound = soundOption;
    _preferences.setString("selectedSound", soundOption);
    notifyListeners();
  }

  List<String> getSoundOptions() => _soundOptions;
}

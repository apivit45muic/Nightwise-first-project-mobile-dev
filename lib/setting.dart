import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'alarm_sound_provider.dart';
import 'theme_provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? _selectedSound = "digital";

  void _onSoundOptionSelected(String? selectedOption) {
    // Get the AlarmSoundProvider instance from the widget tree
    final provider = Provider.of<AlarmSoundProvider>(context, listen: false);

    // Update the selected sound in the provider
    provider.setSelectedSound(selectedOption!);

    // Set the selected sound in the state so it gets displayed in the UI
    setState(() {
      _selectedSound = provider.getSelectedSound();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<AlarmSoundProvider, ThemeProvider>(
        builder: (context, soundProvider, themeProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Alarm Sound",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: soundProvider.soundOptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final soundOption = soundProvider.soundOptions[index];
                    return RadioListTile<String>(
                      title: Text(soundOption, style: TextStyle(fontSize: 24.0,color: Theme.of(context).colorScheme.secondary)),
                      value: soundOption,
                      groupValue: soundProvider.getSelectedSound(),
                      onChanged: _onSoundOptionSelected,
                      activeColor: Theme.of(context).colorScheme.secondary,
                    );
                  },
                ),
              ),
              SwitchListTile(
                title: Text('Dark mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Theme.of(context).colorScheme.secondary)),
                value: themeProvider.isDarkMode,
                onChanged: (value) => themeProvider.toggleTheme(),
              ),
              SizedBox(height: 20,),
            ],
          );
        },
      ),
    );
  }
}

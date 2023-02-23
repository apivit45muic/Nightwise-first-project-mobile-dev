import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:alarm/alarm.dart';
import 'package:provider/provider.dart';
import 'alarm_sound_provider.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Alarm.init();

  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AudioPlayer player = AudioPlayer();
    player.play(AssetSource('RelaxPiano.mp3'));

    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => AlarmSoundProvider(SharedPreferences.getInstance())),
    // other providers if needed
    ],
    child: MaterialApp(
    // your app configuration
      title: 'first-project',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[400],
        bottomAppBarColor: Colors.blueGrey[800],
        scaffoldBackgroundColor: Colors.blueGrey[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white,tertiary: Colors.blueAccent),
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline3: TextStyle(color: Colors.white),

        )

      ),
      initialRoute: '/', // we can omit this (as it is by default anyway)
      routes: {
        '/': (context) => HomeScreen(),
        // '/timedetail': (context) => const TimeSelectScreen(),
        // '/seatdetail': (context) => const SeatSelectScreen(),
        // '/comingsoon': (context) => const ComingSoonScreen(),
        // '/trailer': (context) => const TrailerScreen(),
      },
    ),);
  }
}

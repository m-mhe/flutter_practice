import 'package:flutter/material.dart';
import 'package:water_tracker/screens/water_tracker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Tracker',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Color(0xff299FD5),
            foregroundColor: Colors.white),
      ),
      home: const WaterTrackerScreen(),
    );
  }
}

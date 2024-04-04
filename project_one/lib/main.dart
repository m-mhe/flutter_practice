import 'package:flutter/material.dart';
import 'package:project_one/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            centerTitle: true,
          ),
          drawerTheme: DrawerThemeData(
            width: 250,
            backgroundColor: Colors.orange[200],
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              splashColor: Color(0xFFFF6126)),
          dividerTheme: const DividerThemeData(color: Color(0xFFD67D3E)),
          iconTheme: const IconThemeData(color: Colors.orange, size: 150)),
      title: "Counter",
      home: const Home(),
    );
  }
}

//Import section:
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';

//Code execution point:
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //In here we keep all MaterialApp design configuration.
      theme: ThemeData(
          //Setting up a theme for the whole app.
          appBarTheme: const AppBarTheme(
            //A theme for AppBar.
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            centerTitle: true,
          ),
          drawerTheme: DrawerThemeData(
            //A theme for drawer.
            width: 250,
            backgroundColor: Colors.orange[200],
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              //A theme for floating action button.
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              splashColor: Color(0xFFFF6126)),
          dividerTheme: const DividerThemeData(color: Color(0xFFD67D3E)),
          //A theme for Divider between list items.
          iconTheme: const IconThemeData(color: Colors.orange, size: 150)),
      title: "Counter",
      home: const Home(), //Calling custom widget, that contain Scaffold().
    );
  }
}

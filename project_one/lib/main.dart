//To format code - ctrl + alt + L

//Import section:
import 'package:flutter/material.dart';
import 'package:project_one/settings.dart';

//Code execution point
void main() {
  runApp(const MyApp());
}

//Setting up the Material design system:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ThemeData()",
      themeMode: ThemeMode.light,
      //It will set the light theme. However default is => ThemeMode.light.
      theme: ThemeData(
        //The configurations for light theme.
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            //Theme for our AppBar widget.
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )
            //We can't set theme for InkWell(), and GestureDetector()
            ),
        iconButtonTheme: IconButtonThemeData(
            //Theme for our IconButton() widget.
            style: IconButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue)),
        textButtonTheme: TextButtonThemeData(
            //Theme for our TextButton() widget.
            style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            //Theme for our ElevatedButton() widget.
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)))),
        inputDecorationTheme: InputDecorationTheme(
            //Theme for our TextField() widget.
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue))),
        /*

        Now we do not have to set style for these particulate widgets.

         */
      ),
      darkTheme: ThemeData(
        //The configurations for dark theme.
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.blue,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.blue,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )
            //We can't set theme for InkWell(), and GestureDetector()
            ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
                foregroundColor: Colors.blue, backgroundColor: Colors.black)),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.black,
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, foregroundColor: Colors.blue)),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text(
            "HOME",
            style: TextStyle(color: Colors.blue),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Setting();
                }));
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Setting();
                  }));
                },
                icon: const Icon(Icons.settings)),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Setting();
                  }));
                },
                child: const Text("Setting")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Setting();
                  }));
                },
                child: const Text("Setting")),
            InkWell(
                onDoubleTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Setting();
                  }));
                },
                child: const Text("Double Tap")),
            GestureDetector(
                onHorizontalDragEnd: (c) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Setting();
                  }));
                },
                child: const Column(
                  children: [
                    Text("Slide"),
                    Text(
                        "<-                                                              ->"),
                    Text("Left or Right")
                  ],
                )),
            const TextField()
          ],
        )));
  }
}

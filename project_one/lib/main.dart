//To format code - ctrl + alt + L

import 'package:flutter/material.dart';
import 'package:project_one/settings.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ThemeData()",
      themeMode: ThemeMode.light,
      theme:ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
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
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7)
            )
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue)
          )
        ),
      ),
      darkTheme: ThemeData(
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
                foregroundColor: Colors.blue,
                backgroundColor: Colors.black
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.black,
            )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.blue
            )
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)
            )
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("HOME",
        style: TextStyle(
          color: Colors.blue
        ),),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return Setting();
                })
              );
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder:(context){
                    return const Setting();
                  })
                );
              },
              icon: Icon(Icons.settings)
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context){
                        return const Setting();
                      })
                  );
                },
                child: Text("Setting")
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context){
                        return const Setting();
                      })
                  );
                },
                child: Text("Setting")
            ),
            InkWell(
              onDoubleTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:(context){
                      return const Setting();
                    })
                );
              },
              child: Text("Double Tap")
            ),
            GestureDetector(
                onHorizontalDragEnd: (c){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context){
                        return const Setting();
                      })
                  );
                },
                child: Column(
                  children: [
                    Text("Slide"),
                    Text("<-                                                              ->"),
                    Text("Left or Right")
                  ],
                )
            ),
            TextField()
          ],
        )
      )
    );
  }
}
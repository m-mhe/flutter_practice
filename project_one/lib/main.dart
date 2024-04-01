//Import section:
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';

//Code execution point:
void main(){
  runApp(const MyApp());
}

//This custom widget contain MaterialApp design system:
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Navigation Tester",
      //This page will be shown as home:
      home: HomeRoute(),
    );
  }
}
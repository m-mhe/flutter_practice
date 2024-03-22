import 'package:flutter/material.dart';

//The code execution point
void main(){
  runApp(MyApp());
}

//If we want to use a class as a widget, then we have to inherit (extends) the StatelessWidget class.
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //MaterialApp is a design system.
      title: 'Project One',
      home: HomeBarIcon()
    );
  }
}

class HomeBarText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold will occupy the whole screen of our app.
      backgroundColor: Colors.white,
      body: Center(
        //With the help of our Text() Widget we can display text to our app screen.
        child: Text("Porem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          textAlign: TextAlign.center,
        maxLines: 3,
        style: TextStyle(fontSize: 22,
            fontWeight : FontWeight.w300,
        backgroundColor: Colors.green,
        color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
        ),
      ),
    );
  }
}

class HomeBarIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //With this Icon() widget we can display icons to our app screen, in flutter we can access many pre-build icons with the help of [icons.].
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Icon(Icons.android,
        size: 50,),
      ),
    );
  }
}

class HomeBarImageNetwork extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //In here we are accessing a picture from internet.
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Image.network('https://www.worldatlas.com/r/w1200/upload/da/27/73/shutterstock-459943711.jpg',
          height: 150,
        width: 330,
        fit: BoxFit.cover,),
      ),
    );
  }
}

class HomeBarImageLocal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //We are accessing picture from a local file.
      backgroundColor: Colors.orange[200],
      body: Center(
        child: Image.asset('image/dog.jpg',
        width: 330),
      ),
    );
  }
}

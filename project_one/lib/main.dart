import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project One',
      home: HomeBarImageLocal()
    );
  }
}

class HomeBarText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
      backgroundColor: Colors.orange[200],
      body: Center(
        child: Image.asset('image/dog.jpg',
        width: 330),
      ),
    );
  }
}

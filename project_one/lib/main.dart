import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MMHE",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.pages,
          color: Colors.green.shade900,
        ),
        title: Text('Portfolio',
        style: TextStyle(fontSize: 20,
        color: Colors.green.shade900,
        fontWeight: FontWeight.w600,
        backgroundColor: Colors.green.shade500)
        ),
        actions: [IconButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("This is a portfolio app of Momin Hosan Emon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.w500
                  )
                  ),
                backgroundColor: Colors.green.shade200,
                duration: Duration(microseconds: 200000),
              )
          );
        }, icon: Icon(Icons.info,
          color: Colors.green.shade900
          )
         )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("  Momin Hosan Emon", style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.green.shade900
            ),
            )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("  Coding for a better tomorrow. Let's innovate together!",)
            ],
          ),
          Row(
            children: [
              Image.asset(
                'image/dog.jpg',
              width: 360,
              )
            ],
          ),
          Row(
            children: [
              Image.network(
                "https://www.worldatlas.com/r/w1200/upload/da/27/73/shutterstock-459943711.jpg",
                width: 360,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.android,
              size: 83.09090909,
                color: Colors.green.shade800,
              )
            ],
          ),
        ],
      )
    );
  }
}

class HomeTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Icon(Icons.pages,
            color: Colors.green.shade900,
          ),
          title: Text('Portfolio',
              style: TextStyle(fontSize: 20,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.green.shade500)
          ),
          actions: [IconButton(onPressed: (){
            //showAboutDialog(context: context);
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Info"),
                content: Text("You have clicked info button."),
                actions: [IconButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You clicked a button!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        backgroundColor: Colors.green.shade200,
                        duration: Duration(microseconds: 200000),
                      )
                  );
                }, icon: Icon(Icons.surround_sound_outlined),
                  color: Colors.green.shade900,)],
              );
            });
          }, icon: Icon(Icons.info),
            color: Colors.green.shade900,)],
        ),
        body: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("  Momin Hosan Emon", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.green.shade900
              ),
              ),
              Text("  Coding for a better tomorrow. Let's innovate together!",),
              Image.asset(
                'image/dog.jpg',
                width: 360,
              ),
              Image.network(
                "https://www.worldatlas.com/r/w1200/upload/da/27/73/shutterstock-459943711.jpg",
                width: 360,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.android,
                    size: 83.09090909,
                    color: Colors.green.shade800,
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}


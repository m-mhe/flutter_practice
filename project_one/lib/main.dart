//import section
import 'package:flutter/material.dart'; //Importing material design system.

//Code execution point.
void main(){
  runApp(MyApp());
}

//This custom widget(class) contain material design system.
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //We set our app configuration in here.
      debugShowCheckedModeBanner: false,
      title: "MMHE",
      home: Home(),
    );
  }
}

////This custom widget(class) contain Scaffold.
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold( //With scaffold we can set what we want to display in our app.
      backgroundColor: Colors.white, //This set the background color for our app.
      appBar: AppBar( //AppBarr widget create a app bar.
        backgroundColor: Colors.green, //Background color for app bar.
        leading: Icon(Icons.pages, //with leading attribute we can set an icon in our app bar.
          color: Colors.green.shade900,
        ),
        title: Text('Portfolio', //In AppBar this title widget gives a title to our app.
        style: TextStyle(fontSize: 20, //TextStyle configure text color, size, font weight, etc.
        color: Colors.green.shade900,
        fontWeight: FontWeight.w600,
        backgroundColor: Colors.green.shade500)
        ),
        actions: [IconButton(onPressed: (){ //With this action attribute we can set the action area in our app bar. And the IconButton show an icon on the screen, by configuring this we can also add some functionality.
          ScaffoldMessenger.of(context).showSnackBar( //this one will show a temporal message at the bottom of our screen.
              SnackBar(
                  content: Text("This is a portfolio app of Momin Hosan Emon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.w500
                  )
                  ),
                backgroundColor: Colors.green.shade200,
                duration: Duration(microseconds: 200000), //By setting duration we can set the time for SnackBar.
              )
          );
        }, icon: Icon(Icons.info,
          color: Colors.green.shade900
          )
         )
        ],
      ),
      body: Column( //Column will place gui elements in vertically.
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ //In children list we place our gui elements.
          Row( //Row will place gui elements in horizontally.
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
            showDialog(context: context, builder: (context) { //showDialog will show something like a confirmation message in our screen.
              return AlertDialog( //With AlertDialog we can set a prebuilt dialogue.
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


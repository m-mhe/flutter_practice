//Media query, wrap, layout builder, orientation builder.

//Import section
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Responsive',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsiveness")),
      body: //With OrientationBuilder() we can also change our UI based on screen orientation:
          OrientationBuilder(
        builder: (context, orient) {
          if (orient == Orientation.landscape) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  "This phone is now horizontal",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("This phone is now vertical"),
            );
          }
        },
      ),
    );
  }
}
//This part is about media query:
/*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is ${MediaQuery.of(context).size}"),
            Text("This is height - ${MediaQuery.of(context).size.height}"),
            Text(
                "This is aspectRatio - ${MediaQuery.of(context).size.aspectRatio}"),
            Text(
                "This is width - ${MediaQuery.of(context).size.width.toString()}"),
            Text("This is reverse ${MediaQuery.of(context).size.flipped}"),
            Text(
                "Is size finite - ${MediaQuery.of(context).size.isFinite.toString()}"),
            Text(
                "The longest size is - ${MediaQuery.of(context).size.shortestSide.toString()}")
          ],
        ),
        //Or we can write like this
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${MediaQuery.orientationOf(context)}"),
            Text("${MediaQuery.devicePixelRatioOf(context)}"),
            Text("${MediaQuery.displayFeaturesOf(context)}"),
            Text("This is ${MediaQuery.sizeOf(context)}")
          ],
        ),
        //Wrap is almost same as Row. The key different is - if content overflow by some pixels {for using the Row() widget}, then wrap will go to the next line.
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text("${MediaQuery.orientationOf(context)}"),
            Text("${MediaQuery.devicePixelRatioOf(context)}"),
            Text("${MediaQuery.displayFeaturesOf(context)}"),
            Text("This is ${MediaQuery.sizeOf(context)}")
          ],
        ),
      ),
      //With LayoutBuilder() we can change UI based on our screen size:
      LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 460) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        }
        else if(constraints.maxWidth < 560){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          );
        }else if(constraints.maxWidth < 660){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow,
          );
        }else if(constraints.maxWidth < 760){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        }
        else if(constraints.maxWidth < 860){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          );
        }
        else if(constraints.maxWidth < 960){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow,
          );
        }
        else if(constraints.maxWidth < 1060){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        }
        else if(constraints.maxWidth < 1160){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          );
        }else if(constraints.maxWidth < 1260){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow,
          );
        }else if(constraints.maxWidth < 1360){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        }else if(constraints.maxWidth < 1460){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          );
        }else if(constraints.maxWidth < 1560){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow,
          );
        }else if(constraints.maxWidth < 1660){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          );
        }else if(constraints.maxWidth < 1760){
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
          );
        }
        else{
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.yellow,
          );
        }
      },

      )*/

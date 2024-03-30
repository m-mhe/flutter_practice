//Import block:
import "package:flutter/material.dart";

//Code execution point:
void main(){
  runApp(MyApp());
}

//Custom widget (class), it contain configurations of MaterialApp() design system:
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //To hide the debug banner:
      debugShowCheckedModeBanner: false, //Disabling the debug banner.
      title: "List & Grid",
      home: HomeScreen(),
    );
  }
}

//Custom widget (class), it contain Scaffold() widget:
class HomeScreen extends StatelessWidget{
  List<String> names = ["Emon", "Rahat", "Kibria", "Salam", "Sany", "Lotfour", "billal", "ok", "last", "and", "tHis", "ARe", "some", "extra"];
  @override
  Widget build(BuildContext context) {
    //Scaffold() occupy the whole app screen, to show GUI we write all necessary widgets here.
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], //It will set the background color.
      appBar: AppBar( //Through AppBar() we can- write app title, set icon for leading area, set button for actions area, etc.
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: ListView(
          scrollDirection: Axis.horizontal,
            children: [
          Icon(Icons.list),
          Icon(Icons.grid_4x4),
        ]
        ),
        title: Text("List & Grid",
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),
        ),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog( //Through this we can show a alert dialogue.
                title: Text(
                    "About",
                  style: TextStyle(
                    color: Colors.blue[900]
                  ),
                ),
                content: Text(
                    "This demo app contain: list and grid. The ListView() widget is for showing a list, and the GridView() is for showing a grid.",
                  style: TextStyle(
                    color: Colors.blue[800]
                  ),
                ),
              );
            });
          }, icon: Icon(Icons.help)) //This icon will be shown in the app UI.
        ],
      ),
      /*
      body: SingleChildScrollView( //With the help of SingleChildScrollView() widget we can add scroll functionality to our Row() or Column().
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Text(
                          "This one is a ElevatedButton:",
                          style: TextStyle(
                              color: Colors.green[900]
                          )
                      )
                  ),
                  Padding( //This widget will apply padding to it's child.
                      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0), //How we want our padding.
                      child: ElevatedButton( //This is an ElevatedButton.
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              side: BorderSide( //It will add border to our button.
                                  width: 1,
                                  color: Colors.green.shade600
                              )
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          //padding: EdgeInsets.symmetric(horizontal: 20)
                        ),
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar( //Snack bar message.
                              SnackBar(
                                  duration: Duration(seconds: 1), //Setting up the duration.
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    "Elevated button was pressed!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                              )
                          );
                        },
                        child: Text( //In chid we place a widget. And that widget will show in button surface.
                          "ElevatedButton",
                          style: TextStyle(
                          ),
                        ),
                      )
                  )
                ],
              ),
              Padding( //Adding some padding.
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "This one is a icon button: ",
                      style: TextStyle(
                          color: Colors.green[900]
                      ),
                    ),
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)
                              ),
                            )
                        ),
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 75),
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.green,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //Icon(Icons.mic_external_off),
                                      Text(
                                        "IconButton was pressed!",
                                        //textAlign: TextAlign.center,
                                      )
                                    ],
                                  )
                              )
                          );
                        },
                        icon: Icon(
                          Icons.policy,
                          color: Colors.green,
                        )
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: GestureDetector( //This is a Gesture Detector. With this we can detect gesture from the app user.
                        onHorizontalDragEnd: (c){
                          //String velocity = c.toString();
                          //List<String> store = velocity.split("");
                          //store.removeRange(0, 23);
                          //print(store);
                          //print(c.primaryVelocity);
                          //print(c.velocity);
                          if ((c.primaryVelocity ?? 0) >= 1000 || (c.primaryVelocity ?? 0) <= -1000){ //Adding some logic to show a reactive snack bar message.
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    duration: Duration(seconds: 1), //Duration.
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      "Great, your swiping velocity is ${(c.primaryVelocity??0).toStringAsFixed(2)}!",
                                      textAlign: TextAlign.center,
                                    )
                                )
                            );
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                                "Swipe right or left, with velocity!",
                                style: TextStyle(
                                    color: Colors.green[900]
                                )
                            ),
                            Text(
                                "If you score is higher than ±1000, then you will see",
                                style: TextStyle(
                                    color: Colors.green[900]
                                )
                            ),
                            Text(
                                "a SnackBar massage.",
                                style: TextStyle(
                                    color: Colors.green[900]
                                )
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: TextButton( //This is a TextButton. We can add text or any widget to it's child.
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5
                            )
                        ),
                        onPressed: (){ //It set what will happen if we press this button.
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Text button was pressed!",
                                  textAlign: TextAlign.center,
                                ),
                              )
                          );
                        },
                        //child: Image.asset("image/dog.jpg"),
                        child: Text(
                          "This one is a TextButton",
                          style: TextStyle(
                              color: Colors.green[900]
                          ),
                        ),
                      )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField( //With the help of this widget we can display a functional place to write some text.
                  style: TextStyle(
                      backgroundColor: Colors.white,
                      color: Colors.green[800],
                      fontWeight: FontWeight.w500
                  ),
                  onChanged: (value){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(microseconds: 400000),
                        backgroundColor: Colors.green,
                        content: Text(
                          "You are typing...",
                          textAlign: TextAlign.center,
                        )
                    ));
                    print(value);
                  },
                  maxLength: 28,
                  decoration: InputDecoration(
                    //prefix: Text("Ok now "),
                    prefixIcon: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.green[800],
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.green[800],
                    ),
                    fillColor: Colors.green.withOpacity(0.07),
                    filled: true,
                    labelText: "Type anything...",
                    labelStyle: TextStyle(
                        color: Colors.green[300]
                    ),
                    hintText: "Just type...",
                    hintStyle: TextStyle(
                        color: Colors.green[300],
                        fontWeight: FontWeight.normal
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4
                        ),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Colors.green.shade800
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)
                        )
                    ),
                  ),
                ),
              ),
              Container( //This is a container, it means this can contain anything.
                height: 500,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orange.shade800.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(-4,4)
                    )
                  ],
                  color: Colors.green,
                  image: DecorationImage(
                      image: AssetImage(
                          "image/dog.jpg"
                      ),
                      fit: BoxFit.cover
                  ),
                ),
                child: Text(
                  "This is a Container()",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(1),
                          blurRadius: 15.5,
                          offset: Offset(0,0),
                        )
                      ],
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),*/
      //List will add this scroll functionality dynamically: This one is a static list
      /*body: ListView(
        //scrollDirection: Axis.horizontal,
        children: [
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
          Text("My name is Emon"),
          Divider(),
          Text("My name is Rahat"),
          Divider(),
        ],
      ),*/
      //Now let's explore the GridView():
      //Static grid:
      /*body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1
        ),
        children: [
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Text("Name is Emon"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
          Image.asset("image/dog.jpg"),
          Icon(Icons.android),
          Image.asset("image/dog.jpg"),
        ],
      ),*/
      //Dynamic grid:
      /*body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1
        ),
        itemCount: names.length,
        itemBuilder: (context, index){
          return Text("${index + 1}. ${names[index].toUpperCase()}");
        },
      ),*/
      //This one is a dynamic list & grid:
      body: SingleChildScrollView( //It will add scroll feature.
        child: Column( //Column can contain multiple content vertically.
          children: [
            ListView.builder( //ListView.builder() will build a list dynamically.
              shrinkWrap: true, //It will set a necessary space for this list layout.
              primary: false, //This one is for turning off the default scroll feature.
              itemCount: names.length, //Required for ListView.builder() widget.
                itemBuilder: (context, index){ //Required for ListView.builder() widget.
                  return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text("$index, ${names[index].toUpperCase()}"),
                  );
                }
            ),
            ListView.separated( //It's almost same as the ListView.builder(), but it will take a function through "separatorBuilder:" parameter to add separation between two list items.
              shrinkWrap: true, //It will set a necessary space for this list layout.
              primary: false, //This one is for turning off the default scroll feature.
              itemCount: names.length, //This one is required for the ListView.separated()
              itemBuilder: (context, i){ //This one is required for the ListView.separated()
                return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("${i+1}, ${names[i].toUpperCase()}",
                  textAlign: TextAlign.end,),
                );
              },
              separatorBuilder: (context, index){ //This one is required for the ListView.separated()
                return Divider(); //It is a horizontal line as the separation.
              },
            ),
            GridView.builder( //GridView.builder() can build a grid layout dynamically.
              shrinkWrap: true, //It will set a necessary space for this grid layout.
              primary: false, //This one is for turning off the default scroll feature.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //This one is Required to GridView.builder() widget.
                crossAxisCount: 4,
                childAspectRatio: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
              itemCount: names.length, //This one is Required to function GridView.builder() widget.
              itemBuilder: (context, serialNumber){ //This one is Required to function GridView.builder() widget.
                return Text(
                  "${serialNumber + 1}. ${names[serialNumber].toUpperCase()}",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center);
              },
            )
          ],
        ),
      ),
    );
  }
}
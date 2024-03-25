import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button Tester',
      home: AppHomeBody(),
    );
  }
}

class AppHomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(
          Icons.check_circle,
          size: 23,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.green.shade900,
              blurRadius: 15.5
            )
          ],
        ),
        title: Text(
          'Button Tester',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
              shadows: [
              Shadow(
              color: Colors.green.shade900,
              blurRadius: 15.5
            )
          ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text(
                    "About",
                  style: TextStyle(
                    color: Colors.green[900]
                  ),
                ),
                content: Text(
                    "This is a test project for - buttons(ElevatedButton, IconButton, GestureDetector, InkWell, TextButton), Padding, TextField, Shadow and Container.",
                  style: TextStyle(
                    color: Colors.green.shade900
                  ),
                ),
                actions: [
                  InkWell(
                    splashColor: Colors.green,
                    radius : 5.2,
                    borderRadius: BorderRadius.circular(7),
                    onTap : (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.green,
                          content: Text(
                              "You tapped ok!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                      ),
                      );
                    },
                    child: Text(
                        "OK",
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              );
            });
          }, icon: Icon(
              Icons.pages,
            size: 23,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.green.shade900,
                blurRadius: 15.5
              )
            ],
          )
          )
        ],
      ),
      body: Center(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: Colors.green.shade600
                          )
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        //padding: EdgeInsets.symmetric(horizontal: 20)
                      ),
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 1),
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
                      child: Text(
                          "ElevatedButton",
                        style: TextStyle(
                        ),
                      ),
                    )
                )
              ],
            ),
            Padding(
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
                    child: GestureDetector(
                      onHorizontalDragEnd: (c){
                        //String velocity = c.toString();
                        //List<String> store = velocity.split("");
                        //store.removeRange(0, 23);
                        //print(store);
                        //print(c.primaryVelocity);
                        if ((c.primaryVelocity ?? 0) >= 1000 || (c.primaryVelocity ?? 0) <= -1000){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(microseconds: 600000),
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
                              "If you score is higher than ±1000, than you will see",
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 85,
                        vertical: 200
                      )
                    ),
                    onPressed: (){
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
            )
          ],
        ),
      ),
    );
  }
}
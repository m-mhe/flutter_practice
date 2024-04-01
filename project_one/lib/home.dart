//Import section:(
import 'package:flutter/material.dart';
import 'package:project_one/info.dart';
import 'package:project_one/setting.dart';
import 'package:project_one/profile.dart';

//This custom widget contain Scaffold():
class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Set background color as green with the shade of 100:
      backgroundColor: Colors.green.shade100,
      //AppBar contain - leading, title, action, etc.
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        leading: const Icon(Icons.home),
        title: const Text("Home"),
      ),
      //Rest of the screen will be shown as we add widgets in body.
      body: Center(
        //Column is for adding multiple widgets vertically:
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.green,
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              //Navigating to page to page
              Navigator.push(context,
                  //With push we add a page in stack data structure (LIFO: Last In First Out).
                  MaterialPageRoute(builder: (context) {
                //Setting() is a custom widget, it contain another Scaffold() widget.
                return const Setting();
              }));
            },
            child: const Text("Setting"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 35)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Info();
              }));
            },
            child: const Text("Info"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 26)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Profile(
                    name:
                        "From Home"); //Taking data(name: "From Home") from current page.
              })).then((value) => print("From Profile"));
            },
            child: const Text("Profile"),
          )
        ]),
      ),
    );
  }
}
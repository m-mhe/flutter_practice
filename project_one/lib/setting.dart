//Import section:
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';
import 'package:project_one/info.dart';
import 'package:project_one/profile.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        title: const Icon(Icons.settings),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28)),
            onPressed: () {
              //Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  //pushAndRemoveUntil: will push the HomeRoute() after taking out all pages from the stack.
                  MaterialPageRoute(builder: (context) => const HomeRoute()),
                  (route) => false);
            },
            child: const Text("Home"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 35)),
            onPressed: () {
              Navigator.pushReplacement(
                  context, //Replacing the current page with Info().
                  MaterialPageRoute(builder: (context) {
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const Profile(name: "From Setting");
              }));
            },
            child: const Text("Profile"),
          )
        ]),
      ),
    );
  }
}

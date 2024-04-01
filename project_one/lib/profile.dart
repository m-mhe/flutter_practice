//Import section:
import 'package:flutter/material.dart';
import 'package:project_one/home.dart';
import 'package:project_one/info.dart';
import 'package:project_one/setting.dart';

class Profile extends StatelessWidget {
  final String name;

  const Profile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Image.asset('image/dog.jpg',
                  //height: 100,
                  //fit: BoxFit.cover
                  width: 100)
              /*Icon(Icons.person,
              color: Colors.green[700],
              size: 100,
            ),*/
              ),
          Text(
            name,
            style: TextStyle(
              color: Colors.green[900],
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 28)),
              onPressed: () {
                //Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                    (route) => false);
              },
              child: const Text("Home"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                //padding: const EdgeInsets.symmetric(horizontal: 35)
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Setting()));
              },
              child: const Text("Setting"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 35)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const Info();
                }));
              },
              child: const Text("Info"),
            )
          ]),
        ],
      )),
    );
  }
}

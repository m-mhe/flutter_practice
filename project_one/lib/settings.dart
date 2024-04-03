//Import section:
import 'package:flutter/material.dart';
import 'package:project_one/main.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SETTING"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home)),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("HOME")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Home")),
          InkWell(
              onDoubleTap: () {
                Navigator.pop(context);
              },
              child: const Text("Double Tap")),
          GestureDetector(
            onHorizontalDragEnd: (c) {
              if ((c.primaryVelocity ?? 0) < 0) {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const Home();
                }), (route) => false);
              }
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Slide"),
                Text("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"),
                Text("To Left")
              ],
            ),
          ),
        ],
      )),
    );
  }
}

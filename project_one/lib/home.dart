//Import section:
import 'package:flutter/material.dart';
import 'increment_by_one.dart';
import 'increment_by_two.dart';
import 'increment_by_point_five.dart';
import 'increment_by_point_two_five.dart';

class Home extends StatelessWidget {
  //This is a stateless widget, it means it cant change with the change of variables.
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold will occupy the whole screen, and place UI elements.
      appBar: AppBar(
        leading: const Icon(Icons.home), //An icon for the leading area.
        title: const Text("HOME"), //App title.
      ),
      endDrawer: Drawer(
        //A drawer to the right.
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7), bottomLeft: Radius.circular(7))),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFD67D3E),
              ),
              child: Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Counter",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    )),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ByOne();
                }));
              },
              child: const Text("Increment by one",
                  style: TextStyle(color: Color(0xFFD67D3E))),
            ),
            const Divider(), //Divider between list items.
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ByTwo();
                }));
              },
              child: const Text("Increment by two",
                  style: TextStyle(color: Color(0xFFD67D3E))),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ByPointFive();
                }));
              },
              child: const Text("Increment by point five",
                  style: TextStyle(color: Color(0xFFD67D3E))),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ByPointTwoFive();
                }));
              },
              child: const Text("Increment by point two five",
                  style: TextStyle(color: Color(0xFFD67D3E))),
            ),
            const Divider(),
          ],
        ),
      ),
      body: const Center(
        child: Icon(Icons.add_box),
      ),
    );
  }
}

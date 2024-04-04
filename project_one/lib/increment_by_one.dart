import 'package:flutter/material.dart';
import 'home.dart';
import 'increment_by_two.dart';
import 'increment_by_point_five.dart';
import 'increment_by_point_two_five.dart';

class ByOne extends StatefulWidget {
  const ByOne({super.key});

  @override
  State<ByOne> createState() => _ByOneState();
}

class _ByOneState extends State<ByOne> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_box),
        title: const Text("Increment by one"),
      ),
      endDrawer: Drawer(
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
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }), (route) => false);
                    },
                    child: const Text(
                      "Counter",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    )),
              ),
            ),
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
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage('image/dog.jpg')),
                borderRadius: BorderRadius.circular(10)),
            width: 250,
            height: 250,
            child: Center(
                child: Text(
              value.toString(),
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(3, 0),
                        blurRadius: 8)
                  ]),
            ))),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              value--;
              setState(() {});
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              value++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

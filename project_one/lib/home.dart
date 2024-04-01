import 'package:flutter/material.dart';
import 'package:project_one/info.dart';
import 'package:project_one/setting.dart';
import 'package:project_one/profile.dart';

class HomeRoute extends StatelessWidget{
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        leading: const Icon(Icons.home),
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
              ),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return const Setting();
                  })
                );
              },
              child: const Text("Setting"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 35)
              ),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return const Info();
                }));
              },
              child: const Text("Info"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 26)
              ),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return const Profile(name: "From Home");
                  })
                ).then((value) => print("From Profile"));
              },
              child: const Text("Profile"),
            )
          ]
        ),
      ),
    );
  }
}
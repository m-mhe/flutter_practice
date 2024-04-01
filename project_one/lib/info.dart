import 'package:flutter/material.dart';
import 'package:project_one/home.dart';
import 'package:project_one/setting.dart';
import 'package:project_one/profile.dart';

class Info extends StatelessWidget{
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        title: const Icon(Icons.info),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 28)
                ),
                onPressed: (){
                  Navigator.pop(context);
                  /*Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context){
                        return const HomeRoute();
                      }),
                      (route) {
                        return false;
                      }
                  );*/
                },
                child: const Text("Home"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.white,
                    //padding: const EdgeInsets.symmetric(horizontal: 35)
                ),
                onPressed: (){
                  Navigator.pushReplacement(context,
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
                    padding: const EdgeInsets.symmetric(horizontal: 26)
                ),
                onPressed: (){
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context){
                      return const Profile(name: "From Info");
                    })
                  );
                },
                child: const Text("Profile"),
              )
            ]
        ),
      ),
    );
  }
}
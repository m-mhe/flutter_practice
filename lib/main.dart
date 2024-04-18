//Aspect ratio() || Flexible() || Expanded() || FractionallySizedBox() - This are all widgets (In flutter a framework class is called widget).

//Import section:
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Class Nine",
      home: StartPage(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.5)))),
    );
  }
}

class StartPage extends StatelessWidget {
  //Variables
  final dialogShow = TextEditingController();
  final String dialogMessage =
      "This is a practice app. It contain practice code for: Aspect ratio() || Flexible() || Expanded() || FractionallySizedBox() - This are all widgets (In flutter a framework class is called widget).";
  Map<String, String> itemName = {
    'Joy': 'yellow',
    'devid': 'red',
    'lecon': 'orange',
    'arof': 'blue',
    'jemes potter': 'purple',
    'gj': 'yellow',
    'devsfid': 'red',
    'lesdfcon': 'orange',
    'ardof': 'blue',
    'jemegs potter': 'purple',
    'fJoy': 'yellow',
    'devgid': 'red',
    'lelcon': 'orange',
    'argof': 'blue',
    'jemaes potter': 'purple',
    'Jojy': 'yellow',
    'desvid': 'red',
    'lecgson': 'orange',
    'aroff': 'blue',
    'jemsfes potter': 'purple',
    'Joay': 'yellow',
    'devfaid': 'red',
    'lefcon': 'orange',
    'arqof': 'blue',
    'jemges potter': 'purple',
    'Jaoy': 'yellow',
    'defvid': 'red',
    'lecaon': 'orange',
    'arodf': 'blue',
    'jemes pofgtter': 'purple',
  };

  StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.class_outlined),
        title: Text("Class Nine"),
        actions: [
          IconButton(
              onPressed: () {
                dialogShow.text = dialogMessage;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("What is this about?"),
                        content: TextField(
                          controller: dialogShow,
                          readOnly: true,
                          maxLines: 8,
                          //decoration: InputDecoration(),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.help_outline))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 1,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: itemName.length,
            itemBuilder: (context, i) {
              switch (itemName.values.toList()[i]) {
                case 'yellow':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      child: Text(itemName.values.toList()[i]),
                    );
                  }
                case 'red':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(itemName.values.toList()[i]),
                    );
                  }
                case 'orange':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.orange,
                      child: Text(itemName.values.toList()[i]),
                    );
                  }
                case 'blue':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(itemName.values.toList()[i]),
                    );
                  }
                case 'purple':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: Text(itemName.values.toList()[i]),
                    );
                  }
                default:
                  {
                    return Text(
                      "error",
                      textAlign: TextAlign.center,
                    );
                  }
              }
            },
          ),
          SizedBox(
            height: 5,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 1,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: itemName.length,
            itemBuilder: (context, i) {
              switch (itemName.values.toList()[i]) {
                case 'yellow':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      child: Text(itemName.keys.toList()[i]),
                    );
                  }
                case 'red':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(itemName.keys.toList()[i]),
                    );
                  }
                case 'orange':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.orange,
                      child: Text(itemName.keys.toList()[i]),
                    );
                  }
                case 'blue':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(itemName.keys.toList()[i]),
                    );
                  }
                case 'purple':
                  {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: Text(itemName.keys.toList()[i]),
                    );
                  }
                default:
                  {
                    return Text(
                      "error",
                      textAlign: TextAlign.center,
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
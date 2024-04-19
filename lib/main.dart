//Aspect ratio() || Flexible() || Expanded() || FractionallySizedBox() - This are all widgets (In flutter a framework class is called widget).

//Import section:
import 'package:flutter/cupertino.dart';
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
      body: AspectRatio(aspectRatio: 10/6,
        child: ColoredBox(
          color: Colors.green.shade700,
          child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: ColoredBox(
              color: Colors.red.shade700
            ),
          ),
        ),
      ),

      /*body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ColoredBox(
          color: Colors.green.shade700,
          child: FractionallySizedBox(
            heightFactor: 0.25,
            widthFactor: 0.25,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red.shade700,
                borderRadius: BorderRadius.all(Radius.circular(1000),),
              ),
            ),
          ),
        ),
      ),*/




      /*body: const Column(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight, //If we set fit to FlexFit.tight then child's height doesn't matter.
            child: SizedBox(
              width: 20,
              child: ColoredBox(
                color: Colors.green
              ),
            ),
          ),
          Flexible(
            flex: 1, //The default value of flex.
            fit: FlexFit.tight,
            child: SizedBox(
              width: 20,
              child: ColoredBox(
                  color: Colors.red
              ),
            ),
          ),
          Expanded(
            flex: 2,//By default it's 1.
            //And also by default in Expanded() fit is FlexFit.tight
            child: SizedBox(
              width: 20,
              child: ColoredBox(color: Colors.green),
            ),
          )
        ],
      ),*/



      /*body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: GridView.builder(
              primary: false,
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
                          child: Text(itemName.values.toList()[i],),
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
                        child: Text(itemName.values.toList()[i], style : TextStyle(color: Colors.white)),
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
          ),
          SizedBox(
            height: 5,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: GridView.builder(
              primary: false,
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
                        child: Text(itemName.keys.toList()[i], style : TextStyle(color: Colors.white)),
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
          ),
        ],
      ),*/
    );
  }
}
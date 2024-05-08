import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _slotOne = TextEditingController();
  final TextEditingController _slotTwo = TextEditingController();
  double _result = 00.00;

  void _add(){
    double numberOne = double.tryParse(_slotOne.text) ?? 0;
    double numberTwo = double.tryParse(_slotTwo.text) ?? 0;
    _result = numberOne + numberTwo ;
  }
  void _sub(){
    double numberOne = double.tryParse(_slotOne.text) ?? 0;
    double numberTwo = double.tryParse(_slotTwo.text) ?? 0;
    _result = numberOne - numberTwo ;
  }
  void _multiply(){
    double numberOne = double.tryParse(_slotOne.text) ?? 0;
    double numberTwo = double.tryParse(_slotTwo.text) ?? 0;
    _result = numberOne * numberTwo ;
  }
  void _divide(){
    double numberOne = double.tryParse(_slotOne.text) ?? 0;
    double numberTwo = double.tryParse(_slotTwo.text) ?? 0;
    _result = numberOne / numberTwo ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.calculate_rounded),
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _slotOne,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _slotTwo,
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height / 30),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 7,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _add();
                      },);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('ADD'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30))
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _sub();
                      },);
                    },
                    icon: const Icon(Icons.horizontal_rule_rounded),
                    label: const Text('SUB'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _multiply();
                      },);
                    },
                    child: const Text('* MULTIPLY'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _divide();
                      },);
                    },
                    child: const Text('/ DIVIDE'),
                  ),
                ],
              ),
            ),
            Text('RESULT: $_result')
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'package:flutter/services.dart';


void main() => runApp(const RateofReactionWorkingScreen());


// Define a custom Form widget.
class RateofReactionWorkingScreen extends StatefulWidget {
  const RateofReactionWorkingScreen({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<RateofReactionWorkingScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final time1Controller = TextEditingController();
  final change1Controller = TextEditingController();
  final time2Controller = TextEditingController();
  final change2Controller = TextEditingController();
  final unitController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    time1Controller.dispose();
    change1Controller.dispose();
    time2Controller.dispose();
    change2Controller.dispose();
    unitController.dispose();
    super.dispose();
  }
  var answer = 0.0;
  var answer2 = 0.0;
  var time1 = 0.0;
  var time2 = 0.0;
  var change1 = 0.0;
  var change2 = 0.0;


  void calculate() {
    //Calculate What needs to be calculated
    time1 = double.parse(time1Controller.text);
    time2 = double.parse(time2Controller.text);
    change1 = double.parse(change1Controller.text);
    change2 = double.parse(change2Controller.text);
  }



  @override
  Widget build(BuildContext context) {
    //adjacent = double.parse(adjacentController.text);
    //angle = tan(double.parse(angleController.text) * pi / 180);
    //answer = adjacent * angle;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cuboid Surface Area'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: <Widget>[
            const Text (
              "The Highest Number",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              controller: time1Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What is the first time?',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: change1Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What is the first volume?',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            const Text (
              "The Lowest Numbers",
              textAlign: TextAlign.left,
            ),
            TextFormField(
              controller: time2Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What is the second time?',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: change2Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What is the second volume?',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: unitController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What is the unit?',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    calculate();
                    return const AlertDialog(
                        backgroundColor: Colors.white,
                        content: Text(
                          "Test",
                          style: TextStyle(color: Colors.black),
                        )
                    );
                  },
                );

              },
              tooltip: 'Work Out The Total',
              child: const Text(
                '=',
                style: TextStyle(
                  fontSize: 40.0, // insert your font size here
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
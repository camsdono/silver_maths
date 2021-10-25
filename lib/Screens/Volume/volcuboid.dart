import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:angles/angles.dart';


void main() => runApp(const VolCubiodWorkingScreen());


// Define a custom Form widget.
class VolCubiodWorkingScreen extends StatefulWidget {
  const VolCubiodWorkingScreen({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<VolCubiodWorkingScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final oppositeController = TextEditingController();
  final adjacentController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    adjacentController.dispose();
    oppositeController.dispose();
    super.dispose();
  }
  var answer = 0.0;
  var answer2 = 0.0;
  var opposite = 0.0;
  var adjacent = 0.0;
  var working1 = 0.0;
  var working2 = 0.0;

  void calculate() {
    //Calculate What needs to be calculated
    opposite = double.parse(oppositeController.text);
    adjacent = double.parse(adjacentController.text);
    answer = opposite * opposite + adjacent * adjacent;
    answer.toString();
    answer2 = sqrt(answer);
    answer2.toString();

    working1 = opposite * opposite;
    working2 = adjacent * adjacent;
  }



  @override
  Widget build(BuildContext context) {
    //adjacent = double.parse(adjacentController.text);
    //angle = tan(double.parse(angleController.text) * pi / 180);
    //answer = adjacent * angle;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pythagoras Long Side'),
      ),
      body: Padding(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Flexible(
              child: Text(
                "Length 1"
              )
            ),
            Flexible(
              child: TextField(
                controller: oppositeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What is the opposite?',
                  filled: true,
                  fillColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 10),

            Flexible(
              child: TextField(
                controller: adjacentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What is the adjacent?',
                  filled: true,
                  fillColor: Colors.black,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 450),

            Flexible(
              child: FloatingActionButton(
                // When the user presses the button, show an alert dialog containing
                // the text that the user has entered into the text field.
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      calculate();
                      return AlertDialog(
                          backgroundColor: Colors.white,
                          content: Text(
                            oppositeController.text + "²" + " + " + adjacentController.text + "²" + " = x²"  + "\n" +
                                working1.toString() + " + " + working2.toString() + " = x²" + "\n" +
                                answer.toString() + " = x²" + "\n" +
                                "√" + answer.toString() + " = x²" + "\n" +
                                "x = " + answer2.toStringAsFixed(1),
                            style: const TextStyle(color: Colors.black),
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
            )
          ],

        ),
        padding: const EdgeInsets.all(16.0),

      ),

    );

  }
}
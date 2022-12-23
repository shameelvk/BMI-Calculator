import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SafeArea(child: ScreenHome()),
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _TextController1 = TextEditingController();
  final _TextController2 = TextEditingController();
  String _DisplayText = '';
  void BmiCal() {
    num weight = num.parse(_TextController1.text);
    num height = num.parse(_TextController2.text);
    final heightsqr = pow(height, 2);

    final Bmi = weight / heightsqr;

    if (Bmi < 18) {
      setState(() {
        _DisplayText = "$Bmi (UnderWeight) ";
      });
    } else if (Bmi < 25) {
      setState(() {
        _DisplayText = "$Bmi (Normal) ";
      });
    } else {
      setState(() {
        _DisplayText = "$Bmi (OverWeighted) ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI calculator",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spa,
          children: [
            TextField(
              controller: _TextController1,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.local_dining),
                labelText: "Weight",
                border: OutlineInputBorder(),
                hintText: 'Enter Your Weight',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: TextField(
                controller: _TextController2,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.arrow_upward),
                  labelText: "Height",
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Height',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ElevatedButton(onPressed: BmiCal, child: Text("Calculate")),
            ),
            Text(_DisplayText,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}

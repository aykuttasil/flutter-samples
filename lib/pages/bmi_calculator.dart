import 'package:flutter/material.dart';

const scaffoldBackgroundColor = Color(0xFF090D22);
const appPrimaryColor = Color(0xFF090D22);
const boxColor = Colors.red;

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          primaryColor: appPrimaryColor),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                customBox(),
                customBox(),
              ],
            ),
          ),
          customBox(),
          Expanded(
            child: Row(
              children: [
                customBox(),
                customBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customBox() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: boxColor,
          ),
        ),
      ),
    );
  }
}

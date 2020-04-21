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
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boxColor,
      ),
    );
  }
}

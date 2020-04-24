import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample/pages/bmi_calculator.dart';

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.interpretation,
    @required this.bmiResult,
    @required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              title: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class BMIHandle {
  int height;
  int weight;

  BMIHandle({this.height, this.weight});

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

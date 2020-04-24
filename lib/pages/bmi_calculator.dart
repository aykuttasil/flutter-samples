import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_result_page.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const scaffoldBackgroundColor = Color(0xFF090D22);
const appPrimaryColor = Color(0xFF090D22);

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0XFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum GenderType { MALE, FEMALE, NOTHING }

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          primaryColor: appPrimaryColor),
      home: InputPage(),
      routes: {
        '/result': (context) => ResultPage(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 150;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == GenderType.MALE
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconContent(
                        cardIcon: FontAwesomeIcons.mars, cardText: "MALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.MALE;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == GenderType.FEMALE
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconContent(
                        cardIcon: FontAwesomeIcons.venus, cardText: "FEMALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.FEMALE;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'Calculate',
            onPressed: () {
              var bmiHandle = BMIHandle(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bmiHandle.calculateBMI(),
                    resultText: bmiHandle.getResult(),
                    interpretation: bmiHandle.getInterpretation(),
                  ),
                ),
              );
              // Navigator.pushNamed(context, '/result');
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  BottomButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(15),
        color: Colors.pink,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundedIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  IconContent({this.cardIcon, this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          cardText,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard(
      {this.colour = inactiveCardColour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
      onTap: onPress,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const scaffoldBackgroundColor = Color(0xFF090D22);
const appPrimaryColor = Color(0xFF090D22);
const boxColor = Colors.red;
const selectedBoxColor = Color(0xFFed8484);

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

enum GenderType { MALE, FEMALE, NOTHING }

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;

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
                  child: ReusableCard(
                    colour: selectedGender == GenderType.MALE
                        ? selectedBoxColor
                        : boxColor,
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
                        ? selectedBoxColor
                        : boxColor,
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
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({this.colour = boxColor, this.cardChild, this.onPress});

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

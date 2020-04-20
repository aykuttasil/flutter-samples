import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question {
  String questionText;
  bool answer;

  Question(this.questionText, this.answer);
}

class QuestionPresenter {
  var questionList = <Question>[
    Question('Question 1', true),
    Question('Question 2', true),
    Question('Question 3', false),
    Question('Question 4', true),
    Question('Question 5', false),
    Question('Question 6', false),
    Question('Question 7', true),
    Question('Question 8', true),
    Question('Question 9', false),
    Question('Question 10', true),
    Question('Question 11', true),
    Question('Question 12', false),
    Question('Question 13', true),
  ];

  Question getQuestion(int i) {
    return questionList[i];
  }
}

class QuizzlerPage extends StatefulWidget {
  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  QuestionPresenter presenter = QuestionPresenter();
  int currentQuestion = 0;
  var scoreKeeper = <Widget>[];

  nextQuestion(bool userAnswer) {
    if (presenter.getQuestion(currentQuestion).answer == userAnswer) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKeeper.add(Icon(
        Icons.remove_circle,
        color: Colors.red,
      ));
    }

    setState(() {
      currentQuestion++;
      if (currentQuestion == presenter.questionList.length) {
        currentQuestion = 0;
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    presenter.getQuestion(currentQuestion).questionText,
                    style: GoogleFonts.sourceSansPro()
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      nextQuestion(false);
                    },
                    child: Text("FALSE"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      nextQuestion(true);
                    },
                    child: Text("TRUE"),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}

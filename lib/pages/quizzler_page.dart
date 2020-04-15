import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizzlerPage extends StatelessWidget {
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
                    "Question 1",
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
                    onPressed: () {},
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
                    onPressed: () {},
                    child: Text("TRUE"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

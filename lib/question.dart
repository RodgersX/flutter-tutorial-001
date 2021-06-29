import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  // positional args
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(9.0),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}

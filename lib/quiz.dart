import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int qnIndex;
  final Function answerQn;

  Quiz(this.questions, this.answerQn, this.qnIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[qnIndex]['questionText'] as String,
        ),
        ...(questions[qnIndex]['answers'] as List<Map<String, Object>>)
            .map((ans) {
          return Answer(() => answerQn(ans['score']), ans['text'] as String);
        }).toList()
      ],
    );
  }
}

import 'package:academind/quiz.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myHomepage(),
    );
  }
}

class myHomepage extends StatefulWidget {
  @override
  _myHomepageState createState() => _myHomepageState();
}

class _myHomepageState extends State<myHomepage> {
  var _qnIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qnIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1}
      ]
    },
  ];

  void _answerQn(int score) {
    _totalScore += score;
    setState(() {
      _qnIndex = _qnIndex + 1;
    });
    if (_qnIndex < _questions.length) {
      print('There\'s more questions');
    }
    // print(_qnIndex);
  }

  @override
  Widget build(BuildContext context) {
    // based on Map() class. perfect for complex data

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: _qnIndex < _questions.length
          ? Quiz(_questions, _answerQn, _qnIndex)
          : Result(_totalScore, _resetQuiz),
    );
  }
}

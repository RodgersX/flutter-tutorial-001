import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQn() {
    setState(() {
      _qnIndex = _qnIndex + 1;
    });
    print(_qnIndex);
  }

  @override
  Widget build(BuildContext context) {
    // based on Map() class. perfect for complex data
    List questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': ['Max', 'Max', 'Max', 'Max']
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Column(
        children: [
          Question(
            questions[_qnIndex]['questionText'],
          ),
          ...(questions[_qnIndex]['answers'] as List<String>).map((ans) {
            return Answer(_answerQn, ans);
          }).toList()
        ],
      ),
    );
  }
}

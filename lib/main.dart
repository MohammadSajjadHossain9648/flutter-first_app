import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void debugShow() {
    print('Answer choosen!!');
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color??',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 3,
        },
        {
          'text': 'Green',
          'score': 5,
        },
        {
          'text': 'White',
          'score': 1,
        },
      ],
    },
    {
      'questionText': 'What\'s your favourite fruit??',
      'answers': [
        {
          'text': 'Apple',
          'score': 4,
        },
        {
          'text': 'Banana',
          'score': 3,
        },
        {
          'text': 'Mango',
          'score': 10,
        },
        {
          'text': 'Jackfruit',
          'score': 5,
        }
      ],
    }
  ];

  var _index = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _index += 1;
    });
    if (_index < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Game App'),
        ),
        body: _index < _questions.length
            ? Quiz(
                questions: _questions,
                index: _index,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

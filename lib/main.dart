import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Myapp> {
  final _question = const [
    {
      'questionText': 'Q1. What is your favorite rider?',
      'answers': [
        {'text': 'Ghost', 'score': -2},
        {'text': 'Agito', 'score': 10},
        {'text': 'Ryuki', 'score': 0},
        {'text': 'Kabuto', 'score': 1},
      ],
    },
    {
      'questionText': 'Q2. What is your favorite monster?',
      'answers': [
        {'text': 'Gurongi', 'score': 10},
        {'text': 'Fangire', 'score': 0},
        {'text': 'Dopant', 'score': -15},
        {'text': 'Undead', 'score': 5},
      ],
    },
    {
      'questionText': 'Q3. Who is your favorite 2nd rider?',
      'answers': [
        {'text': 'G3-x', 'score': 10},
        {'text': 'Kaixa', 'score': 20},
        {'text': 'Diend', 'score': -15},
        {'text': 'Meteor', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < _question.length) {
      print('we have more questions!');
    } else {
      print('no more questions!');
    }
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Rider Quiz'),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    ),
  );
}

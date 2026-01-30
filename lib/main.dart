import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'Q1. Rider pertama dengan ability yang sama persis dengan rider pendahulu?',
      'answers': [
        {'text': 'Legend', 'score': -2},
        {'text': 'Zi-O', 'score': -2},
        {'text': 'V3', 'score': 10},
        {'text': 'Decade', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Rider yang merevolusi franchise?',
      'answers': [
        {'text': 'Ichigo', 'score': -2},
        {'text': 'Black', 'score': -2},
        {'text': 'W', 'score': -2},
        {'text': 'Ryuki', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Strongest Rider',
      'answers': [
        {'text': 'Kuuga', 'score': -2},
        {'text': 'ZI-O', 'score': 10},
        {'text': 'Deacde', 'score': -2},
        {'text': 'Diend', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Seri dengan nuansa Horror?',
      'answers': [
        {'text': 'Kuuga', 'score': 10},
        {'text': 'Gaim', 'score': -2},
        {'text': 'Ghost', 'score': -2},
        {'text': 'Revice', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Jumlah Corak Warna OOO?',
      'answers': [
        {'text': '4', 'score': -2},
        {'text': '3', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _totalScore += score;
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rider Quiz'),
          backgroundColor: Colors.pink[800],
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

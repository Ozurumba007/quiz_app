import 'package:flutter/material.dart';
import 'package:quiz_provider/answer.dart';
import 'package:quiz_provider/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Green', 'White'],
    },
    {
      'questionText': 'who\'s your favorite Instructor?',
      'answers': ['Max', 'Leo', 'Max', 'Mac'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      print('We have more question!');
    } else {
      print('No more question');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < questions.length
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Question(
                      questions[_questionIndex]['questionText'] as String,
                    ),
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestion, answer);
                    }).toList()
                  ],
                ),
              )
            : Center(
                child: Text('You did it '),
              ),
      ),
    );
  }
}

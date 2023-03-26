import 'package:flutter/material.dart';
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
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex],
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('answer 1'),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('answer 2'),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questions = [
    {
      'questionText': 'Who was the fourth Hokage?',
      'answers': [{'text': 'Hiruzen','score':0}, 
                  {'text': 'Tsunade','score':0}, 
                  {'text': 'Danzō','score':0},
                  {'text': 'Minato','score':1}]
    },
    {
      'questionText': 'What is the name of 4 tail beast?',
      'answers': [{'text': 'Shukaku','score':0},
                  {'text': 'Kokuo','score':0},
                  {'text': 'Gyuki','score':0},
                  {'text': 'Son Goku','score':1}]
    },
    {
      'questionText': 'Who is best friend of Naruto?',
      'answers': [{'text': 'Hinata','score':0},
                  {'text': 'Sasuke','score':1},
                  {'text': 'Sakura','score':0},
                  {'text': 'Gaara','score':0}]
    },
    {
      'questionText': 'Waht is the episode where Naruto becomes hero of Leaf Village?',
      'answers': [{'text': '175','score':1},
                  {'text': '178','score':0},
                  {'text': '465','score':0},
                  {'text': '468','score':0}]
    }
  ];
  var indexQuestions = 0;
  var totalScore = 0;
  
  void answerQuestion(int score) {
    totalScore += score;
    print(totalScore);
    setState(() {
      indexQuestions = indexQuestions + 1;
    });
  }

  void startAgain() {
    setState(() {
      indexQuestions = 0;
      totalScore=0;
    });
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: indexQuestions < questions.length
            ? Quiz(questions:questions ,indexQuestions:indexQuestions,answerQuestion:answerQuestion)
            : Result(startAgain,totalScore),
      ),
    );
  }
}

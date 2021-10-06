import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int indexQuestions;
  final Function answerQuestion;

  Quiz ({
    @required this.questions, 
    @required this.indexQuestions, 
    @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question((questions[indexQuestions]['questionText'] as String)),
        // ElevatedButton(child: Text('Answer 1'), onPressed: answerQuestion),
        // ElevatedButton(child: Text('Answer 2'), onPressed: answerQuestion),
        //ElevatedButton(child: Text('Elavated Button'), onPressed: answerQuestion,style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightGreen), )),
        // Answer(answerQuestion,(questions[indexQuestions]['answers'] as List<String>)[0]),
        // Answer(answerQuestion,(questions[indexQuestions]['answers'] as List<String>)[1]),
        // Answer(answerQuestion,(questions[indexQuestions]['answers'] as List<String>)[2]),
        // Answer(answerQuestion,(questions[indexQuestions]['answers'] as List<String>)[3])
        ...(questions[indexQuestions]['answers'] as List<Map<String,Object>>).map((answer) {  //as List<Map<String,Object>>
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}

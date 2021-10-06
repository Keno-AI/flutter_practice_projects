import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './answer.dart';

class Result extends StatelessWidget {
  final Function startAgain;
  final int totalScore;
  String resultText;

  Result(this.startAgain,this.totalScore);

  @override
  Widget build(BuildContext context) {
    if (totalScore ==4){
      resultText = 'You are one in a million!';
    }else if (totalScore == 0) {
      resultText = 'Go home child. Naruto is not for you.';
    }else{
      resultText = 'Keep trying. You answered $totalScore question right';
    }
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(100),
        child: Column(children: [
          Text(resultText,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center),
          Answer(startAgain, 'Start Again')
        ]));
  }
}

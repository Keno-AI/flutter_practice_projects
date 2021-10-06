import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function callBack;
  final String textAnswer;

  Answer(this.callBack,this.textAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          child: Text(textAnswer), onPressed: callBack, color: Colors.blue),
    );
  }
}

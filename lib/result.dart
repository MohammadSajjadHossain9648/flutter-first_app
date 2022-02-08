import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  String resultText;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    if (resultScore <= 8) {
      resultText = 'So Bad!!!';
    } else if (resultScore <= 13) {
      resultText = 'You are awasome and innocent';
    } else if (resultScore <= 16) {
      resultText = 'Pretty Likeable';
    } else {
      resultText = 'you are ..... strange!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz!!',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

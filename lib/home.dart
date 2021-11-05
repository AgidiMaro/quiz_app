import 'dart:ui';

import 'package:flutter/material.dart';

import 'model/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Emmanuel is the President of Nigeria", true),
    Question.name("Joy is the President of Nigeria", false),
    Question.name("Grace is Amazing", true),
    Question.name("Jesus loves me", true),
    Question.name("God loves me eternally", true),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Image.asset("images/flag.png",width: 250,height: 180,)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.blueGrey.shade400, style: BorderStyle.solid
                  )
                ),
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(questionBank[_currentQuestionIndex].questionText,style: TextStyle(fontSize: 16.9,color: Colors.white),)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: ()=>_previousQuestion(),
                  child: Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900
                  ),),

                ElevatedButton(onPressed: ()=>_checkAnswer(true),
                child: Text("True"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey.shade900
                ),),

                ElevatedButton(onPressed: ()=>_checkAnswer(false),
                  child: Text("False"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900
                  ),),

                ElevatedButton(onPressed: ()=>_nextQuestion(),
                  child: Icon(Icons.arrow_forward),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900
                  ),),

              ],
            ),
            Spacer(),

          ],

        )
      ),
      );
  }

  _checkAnswer(bool userChoice) {
    if(userChoice==questionBank[_currentQuestionIndex].isCorrect){

      final snackBar = SnackBar(
          content: Text('Correct'),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();

    }else{
      debugPrint("Incorrect");
      final snackBar = SnackBar(content: Text('Incorrect'),duration: Duration(milliseconds: 500),backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }

  _nextQuestion() {

    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex+1) % questionBank.length;
    });

  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex-1) % questionBank.length;
    });
  }
}

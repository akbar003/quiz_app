import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/components/QuestionData.dart';
import 'package:quiz_app/components/question.dart';

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  // List<bool> answers = [false, false, true, false, false, false];
  List<Icon> scoreKeeper = [];
  QuestionData questionData = QuestionData();
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Question
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    questionData.questionBank[questionNumber].questionText,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // True
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  fillColor: Colors.green,
                  onPressed: () {
                    bool correctAnswer =  questionData.questionBank[questionNumber].answerText;
                    if (correctAnswer == true) {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    setState(() {
                      if (questionNumber <= 3) {
                        questionNumber++;
                      }
                    });
                  },
                ),
              ),
            ),
            // False
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "False",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  fillColor: Colors.red,
                  onPressed: () {
                    bool correctAnswer = questionData.questionBank[questionNumber].answerText;
                    if (correctAnswer == false) {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    setState(() {

                        questionNumber++;

                    });
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: scoreKeeper,
                // children: [
                //   const Icon(Icons.check, color: Colors.green,),
                //   const Icon(Icons.close, color: Colors.red,),
                //   const Icon(Icons.check, color: Colors.green,)
                // ],
              ),
            ),
            if (questionNumber > 5)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No more questions available.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

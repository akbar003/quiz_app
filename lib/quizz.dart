import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  List<bool> answers = [false, false, true, false, false, false];
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'The sun is a planet.',
    'Nawas Sharif is a loyal person',
    'Water boils at 100°C at sea level.',
    'The Great Wall of China is visible from space with the naked eye.',
    'Oxygen is the most abundant element in Earth\s atmosphere.',
    "pakistran is a very rich country",
  ];
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
                    questions[questionNumber],
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
                    bool correctAnswer = answers[questionNumber];
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
                    bool correctAnswer = answers[questionNumber];
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
                      if (questionNumber < questions.length - 1) {
                        questionNumber++;
                      }
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
            if (questionNumber == questions.length - 1)
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
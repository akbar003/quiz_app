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

  List<Icon> scoreKeeper = [];
  QuestionData questionData = QuestionData();


  showIcons(bool userPickedAnswer){
    setState(() {
      if(questionData.isFinished()==true){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('Finished'),
            content: Text('Bas kar Bhai our kitna kelega',style: TextStyle(fontSize: 18),),
            actions: [
              RawMaterialButton(
                child: Text('SAE da ror'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
        questionData.resetQuestionNumber();
        scoreKeeper = [];

      }
     else {
        bool correctAnswer = questionData.getanswerText(); //true
        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(Icon(Icons.check_circle, color: Colors.green,));
        } else {
          scoreKeeper.add(Icon(Icons.close_rounded, color: Colors.red,
          ));
        }
        questionData.nextQuestion();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
        // First background color
        Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
      ),

      // Second background color with opacity
      Container(
        color: Colors.red.withOpacity(0.5),
        width: double.infinity,
        height: double.infinity,
      ),

      // Third background color with opacity
      Container(
        color: Colors.green.withOpacity(0.3),
        width: double.infinity,
        height: double.infinity,
      ),
        SafeArea(
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
                      questionData.getQuestionData(),
                      style: TextStyle(color: Colors.black, fontSize: 24),
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

                     showIcons(true);
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
                      showIcons(false);
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
              // if (questionNumber >=5)
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Text(
              //       'No more questions available.',
              //       style: TextStyle(color: Colors.white),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

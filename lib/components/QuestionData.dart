import 'package:quiz_app/components/question.dart';

class QuestionData{
  int _questionNumber = 0;
  List _questionBank=[
    // Question(questionText: 'The sun is a planet.', answerText: false,),
    // Question(questionText: 'Nawas Sharif is a loyal person', answerText: false),
    // Question(questionText: 'Water boils at 100°C at sea level.', answerText: true),
    // Question(questionText: 'The Great Wall of China is visible from space with the naked eye.', answerText: false),
    // Question(questionText: 'Oxygen is the most abundant element in Earth\s atmosphere.', answerText: false),
    // Question(questionText: "pakistran is a very rich country", answerText: false),
    Question(questionText: 'ARP is used to resolve IP addresses to MAC addresses.', answerText: true,),
    Question(questionText: 'OSPF is a distance-vector routing protocol.', answerText: false,),
    Question(questionText: 'VLANs operate at Layer 3 of the OSI model.', answerText: false,),
    Question(questionText: 'A /30 subnet mask provides 2 usable IP addresses.', answerText: true,),
    Question(questionText: 'EIGRP is a Cisco proprietary routing protocol.', answerText: true,),
    Question(questionText: 'TCP is a connectionless protocol.', answerText: false,),
    Question(questionText: 'SSH operates on port 22.', answerText: true,),
    Question(questionText: 'RSTP is an improvement over STP to provide faster convergence.', answerText: true,),
    Question(questionText: 'The default administrative distance for OSPF is 90.', answerText: false,),
    Question(questionText: 'ICMP is used for error reporting and diagnostics.', answerText: true,),
  ];
  String getQuestionData(){
   return _questionBank[_questionNumber].questionText;
  }
  bool getanswerText(){
   return _questionBank[_questionNumber].answerText;
  }
  void nextQuestion(){
    if(_questionNumber < _questionBank.length -1)
    _questionNumber++;
  }
  bool isFinished(){
    if(_questionNumber >=_questionBank.length-1){
      return true;
    }
    else{
      return false;
    }
  }
  resetQuestionNumber(){
    _questionNumber=0;
  }

}
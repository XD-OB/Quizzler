import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(
              Icons.check_circle,
              color: Colors.white
          ),
          title: Text(
            'Quizzler',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Knewave',
            ),
          ),
        ),
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

QuestionBrain qBrain = QuestionBrain();

class _QuizPageState extends State<QuizPage> {

  List<Icon>  scoreKeeper1 = [];
  List<Icon>  scoreKeeper2 = [];
  int         score = 0;

  void  fillScoreKeepers(Icon icon) {
    if (scoreKeeper1.length < 17)
      scoreKeeper1.add(icon);
    else
      scoreKeeper2.add(icon);
  }

  void alert(int score)
  {
    if (score > 13) {
      return Alert(
        context: context,
        style: AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.green,
          ),
        ),
        title: "Winner !",
        desc: "Your score is: $score / 26",
        buttons: [
          DialogButton(
            child: Text(
              "Retry!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        style: AlertStyle(
          animationType: AnimationType.fromTop,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          descStyle: TextStyle(fontWeight: FontWeight.bold),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.red,
          ),
        ),
        title: "Loser :(",
        desc: "Your score is: $score / 26",
        buttons: [
          DialogButton(
            child: Text(
              "Retry!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }

  void  checkAnswer(bool value) {
    setState(() {
      if (qBrain.isSafeNext()) {
        if (qBrain.getQuestionAnswer() == value) {
          fillScoreKeepers(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          score++;
        } else {
          fillScoreKeepers(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        qBrain.nextQuestion();
      } else {
        qBrain.reset();
        scoreKeeper1.clear();
        scoreKeeper2.clear();
        alert(score);
        score = 0;
      }
    });
  }

  Expanded exPadButton({bool value, Color color}) {
    String  str;

    if (value == true)
      str = 'Yes';
    else
      str = 'No';
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
        child: RaisedButton(
          onPressed: () => checkAnswer(value),
          color: color,
          child: Text(
            str,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                qBrain.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Knewave',
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        exPadButton(value: true, color: Colors.green),
        exPadButton(value: false, color: Colors.red),
        Row(children: scoreKeeper1),
        Row(children: scoreKeeper2),
      ]
    );
  }
}
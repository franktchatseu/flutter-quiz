import 'package:flutter/material.dart';
import './quiz.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //propriete du quiz
  int score = 0;
  int currentQuestion = 0;
  var quiz = [
    {
      "title": "un framework pour le language java",
      "answers": [
        {"answer": "Spring", "correct": true},
        {"answer": "Laravel", "correct": false},
        {"answer": "Django", "correct": false},
      ]
    },
    {
      "title": "Port par defaud du serveur angular ",
      "answers": [
        {"answer": "8080", "correct": false},
        {"answer": "4200", "correct": true},
        {"answer": "8000", "correct": false},
      ]
    },
    {
      "title": "Language qui n'est pas oriente object",
      "answers": [
        {"answer": "JAVA", "correct": false},
        {"answer": "C", "correct": true},
        {"answer": "PHP", "correct": false},
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
            style: TextStyle(fontSize: 20, backgroundColor: Colors.blue),
          ),
        ),
        body:(this.currentQuestion == quiz.length)?
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Votre score est: ${score}/${50*quiz.length}",style: TextStyle(fontSize: 24,color: Colors.deepOrangeAccent,),),
                  Divider(),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: (){
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                    },
                    child: Text("Restart...",style: TextStyle(fontSize: 24,color: Colors.white),),
                  ),
                ],
              ),
            )

        :ListView(
          children: [
            ListTile(
              title: Center(
                  child: Text(
                "Question ${currentQuestion + 1}/${quiz.length}",
                style: TextStyle(fontSize: 22, color: Colors.deepOrange),
              )),

            ),

            ListTile(
              title: Text(
                quiz[this.currentQuestion]['title'],
                style: TextStyle(fontSize: 22),
              ),
            ),
            ...(quiz[currentQuestion]['answers'] as List<dynamic>)
                .map((answer) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (answer['correct']) score = score + 50;
                        if (currentQuestion < quiz.length) {
                          this.currentQuestion++;
                        }
                      });
                    },
                    color: Colors.lightBlue,
                    child: Text(
                      answer['answer'],
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              );
            })
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  int score;
  int acerto;
  ScoreScreen(this.score,this.acerto);
  @override
  _ScoreScreenState createState() => _ScoreScreenState(score,acerto);
}

class _ScoreScreenState extends State<ScoreScreen> {
  int score;
  int acerto;
  _ScoreScreenState(this.score,this.acerto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 24, 0, 82),
                  Color.fromARGB(255, 0, 38, 173)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sumário:",textAlign:
              TextAlign.center ,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 50.0,
              ),
              ),
              Text("$score",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0
              ),
              ),
              Text("$acerto",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                ),
              )
            ],
          ),
        )
    );
  }
}

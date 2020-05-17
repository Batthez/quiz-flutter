import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/screens/home_screen.dart';

class ScoreScreen extends StatefulWidget {
  int score;
  int acerto;
  double moedas;
  ScoreScreen(this.score,this.acerto,this.moedas);
  @override
  _ScoreScreenState createState() => _ScoreScreenState(score,acerto,moedas);
}

class _ScoreScreenState extends State<ScoreScreen> {
  int score;
  int acerto;
  double moedas;
  _ScoreScreenState(this.score,this.acerto,this.moedas);
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
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),
                child: Text("SUMÁRIO",textAlign:
                TextAlign.center ,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 60.0,
                    fontFamily: "Times New Roman",
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: Text("Sua pontuação foi: $score",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0
                  ),
                ),
              ),
              Text("Total de acertos: $acerto",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 70.0),
                child: Text("Moedas: +$moedas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 36.0
                ),
                )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                height: 80.0,
                  child: RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)
                    ),
                    child: Text(
                      "Retornar",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                    },
                  )
              )
            ],
          ),
        )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/play_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
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
              padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,60.0),
              child: Text("QUIZ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 150.0,
                  fontFamily: "Times New Roman",
                ),
              ),
            ),
            Container(
              height: 100.0,
              padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,5.0),
              child: botao('JOGAR', 60.0, 0, context)
            ),
            Container(
              height: 80.0,
              padding: EdgeInsets.fromLTRB(40.0,0.0,40.0,5.0),
              child: botao('CADASTRAR', 40.0, 1, context)
            ),
            Container(
                height: 80.0,
                padding: EdgeInsets.fromLTRB(80.0,0.0,80.0,0.0),
                child: botao('LOJA', 35.0, 1, context)
            ),
          ],
        ),
      ));
  }
RaisedButton botao(String nomebotao, double tamanho, int opcao, BuildContext context){
    return RaisedButton(
      color: Colors.orange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)
      ),
      child: Text(
        nomebotao,
        style: TextStyle(
          fontSize: tamanho,
         color: Colors.black,
        ),
      ),
      onPressed: (){
        switch(opcao){
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PlayScreen()));
            break;
          case 1:
            break;
          case 2:
            break;

        }
      }
    );
}
}



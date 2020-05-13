import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 232, 132, 19),
        Color.fromARGB(255, 207, 81, 146)
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
                  fontSize: 100.0,
                  fontFamily: "Times New Roman",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: botao('JOGAR', 40.0, 0)
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: botao('CADASTRAR', 35.0, 1)
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: botao('LOJA', 30, 2)
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: botao('SAIR', 27, 3)
            ),
          ],
        ),

    )
    );
  }
FlatButton botao(String nomebotao, double tamanho, int opcao){
    return FlatButton(
      child: Stack(
        children: <Widget>[
          Text(
            nomebotao,
            style: TextStyle(
              fontSize: tamanho,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = Colors.black,
            ),
          ),
          Text(
            nomebotao,
            style: TextStyle(
              fontSize: tamanho,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
      onPressed: (){
        switch(opcao){
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;

        }
      }
    );
}
}



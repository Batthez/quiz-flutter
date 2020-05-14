import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Questão 1",
        style: TextStyle(
          fontSize: 25.0,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
                child: Text(
                  "1.Um desenhista pretende elaborar um desenho técnico utilizando uma escala de 1:250. Sabendo-se que, um dos elementos do objeto representados tem o comprimento s= 15 cm calcule o comprimento real do objeto em metro (m) e marque a alternativa correta.",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: botaoescolhas("A. 3500,00cm", 25.0, 0, context)),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: botaoescolhas("B. 37,50m", 25.0, 0, context)),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: botaoescolhas("C. 0,060m", 25.0, 0, context)),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: botaoescolhas("D. 37,50cm", 25.0, 0, context)),
            ]
        ),
      )
    );
  }

  RaisedButton botaoescolhas(
      String resposta, double tamanho, int alternativas, BuildContext context)
  {
    return RaisedButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
        child: Text(
          resposta,
          style: TextStyle(
            fontSize: tamanho,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          switch (alternativas) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
          }
        });
  }
}

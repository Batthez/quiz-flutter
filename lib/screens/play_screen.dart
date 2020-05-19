import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/score.dart';

class PlayScreen extends StatefulWidget {
  var listaDeQuestoes;


  PlayScreen(this.listaDeQuestoes);

  @override
  _PlayScreenState createState() => _PlayScreenState(listaDeQuestoes);
}

class _PlayScreenState extends State<PlayScreen> {
  var numQuestao = 0;
  int a = 0, b = 1, c = 2, d = 3;
  int score = 0;
  double moedas = 0;
  List<DocumentSnapshot> listaDeQuestoes = List();

  _PlayScreenState(this.listaDeQuestoes);
  int _contador = 30;
  Timer timer;
  String _mostrartimer = "30";
  bool _cancelartimer = false;
  int acerto = 0;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    timer = Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (_contador < 1) {
          t.cancel();
          trocandoQuestao();
        } else if (_cancelartimer == true) {
          t.cancel();
        } else {
          _contador = _contador - 1;
        }
        _mostrartimer = _contador.toString();
      });
    });
  }
@override
  void dispose() {
    setState(() {
      _cancelartimer = true;
    });
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Questão ${numQuestao + 1}/${listaDeQuestoes.length} $_mostrartimer",
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
                  padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
                  child: Text(
                    "${listaDeQuestoes[numQuestao]["enunciado"]}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
                    child: botaoescolhas(
                        "A. ${listaDeQuestoes[numQuestao]["alternativas"][a]}", 25.0, a, context,)
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: botaoescolhas(
                        "B. ${listaDeQuestoes[numQuestao]["alternativas"][b]}", 25.0, b, context,)
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: botaoescolhas(
                        "C. ${listaDeQuestoes[numQuestao]["alternativas"][c]}", 25.0, c, context,)
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: botaoescolhas(
                        "D. ${listaDeQuestoes[numQuestao]["alternativas"][d]}", 25.0, d, context,)
                ),
              ]),
        ));
  }

  RaisedButton botaoescolhas(String resposta, double tamanho, int alternativas,
      BuildContext context) {
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
          verificaQuestao(alternativas);
        });
  }

  void trocandoQuestao() {
    _cancelartimer = false;
    _contador = 30;
    setState(() {
      Future.delayed(Duration(seconds: 3));
      if (numQuestao == listaDeQuestoes.length - 1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ScoreScreen(score,acerto,moedas)));
      } else {
        numQuestao++;
      }
    });
    startTimer();
  }
  void verificaQuestao(alternativas) {
    timer.cancel();
    _contador = 30;
    if(alternativas == listaDeQuestoes[numQuestao]["questaoCerta"]) {
      acerto++;
      if(_contador > 20){
        score += 10;
        moedas = score*(1.5);
      } else if(_contador>10){
        score += 5;
        moedas = score*(2.0);
      }else{
        score += 2;
        moedas = score*(2.5);
      }
    }
    trocandoQuestao();
  }
}

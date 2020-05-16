import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  var listaDeQuestoes;



  PlayScreen(this.listaDeQuestoes);

  @override
  _PlayScreenState createState() => _PlayScreenState(listaDeQuestoes);
}

class _PlayScreenState extends State<PlayScreen> {
  var numQuestao = 0;
  int a = 0, b = 1, c = 2, d = 3;
  List<DocumentSnapshot> listaDeQuestoes = List();

  _PlayScreenState(this.listaDeQuestoes);
  int _timer = 30;
  String _mostrartimer = "30";
  bool _cancelartimer = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (_timer < 1) {
          t.cancel();
          trocandoQuestao();
        } else if (_cancelartimer == true) {
          t.cancel();
        } else {
          _timer = _timer - 1;
        }
        _mostrartimer = _timer.toString();
        print(_mostrartimer);
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
                  padding: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
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
          _cancelartimer = false;
          trocandoQuestao( alternativas: alternativas);
        });
  }

  void trocandoQuestao({int alternativas}) {
    setState(() {
      Future.delayed(Duration(seconds: 3));
      if (numQuestao == listaDeQuestoes.length - 1) {
      } else {
        numQuestao++;
      }
    });
  }
  bool verificaQuestao(alternativas) {
    return alternativas == listaDeQuestoes[numQuestao]["questaoCerta"];
  }
}

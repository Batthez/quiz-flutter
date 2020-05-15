import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int numQuestao = 0;
  String questao = "", a = "",b = "",c = "",d = "";

  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> listaDeQuestoes = List();
    Firestore.instance.collection("questoes").getDocuments().then((snapshot){
      listaDeQuestoes = snapshot.documents;

        for(var documento in listaDeQuestoes){
          Future.delayed(Duration(seconds: 20)).then((a){
          });
          numQuestao++;
          questao = documento["enunciado"];
          a = documento["alternativas"][0];
          b = documento["alternativas"][1];
          c = documento["alternativas"][2];
          d = documento["alternativas"][3];
        }


    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Questão $numQuestao",
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
                  "$questao",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
                  child: botaoescolhas("A. $a", 25.0, 0, context)),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: botaoescolhas("B. $b", 25.0, 0, context)),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: botaoescolhas("C. $c", 25.0, 0, context)),
              Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: botaoescolhas("D. $d", 25.0, 0, context)),
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

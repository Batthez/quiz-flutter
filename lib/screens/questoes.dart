import 'package:flutter/material.dart';

class QuestaoScreen extends StatefulWidget {
  @override
  _QuestaoScreenState createState() => _QuestaoScreenState();
}

class _QuestaoScreenState extends State<QuestaoScreen> {
  String tituloSecao = '';
  String labeltext = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Cadastro de Questões'),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Materia", border: OutlineInputBorder())),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite o Enunciado da Quetão", border: OutlineInputBorder())),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (A)", border: OutlineInputBorder())),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (B)", border: OutlineInputBorder())),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (C)", border: OutlineInputBorder())),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (D)", border: OutlineInputBorder())),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Letra da Alternativa Correta! ", border: OutlineInputBorder())),
            Column(
              children: <Widget>[
                RaisedButton(
                  color: Colors.deepPurple,
                  splashColor: Colors.white,
                  elevation: 4.0,
                  child: Text('Cadastrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ])
        )
    );
  }
}

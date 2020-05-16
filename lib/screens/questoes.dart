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
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Cadastro de Questões'),
        ),
        body: Column(children: <Widget>[
          TextField(
            style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Digite a Materia", border: OutlineInputBorder())),
          Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.black,
                splashColor: Colors.white,
                elevation: 4.0,
                child: Text('Proximo',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              )
            ],
          ),
        ]));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestaoScreen extends StatefulWidget {
  @override
  _QuestaoScreenState createState() => _QuestaoScreenState();
}

class _QuestaoScreenState extends State<QuestaoScreen> {
  String tituloSecao = '';
  String aviso = "";
  String labeltext = '';
  var materiaController = TextEditingController();
  var enunciadoController = TextEditingController();
  var aController = TextEditingController();
  var bController = TextEditingController();
  var cController = TextEditingController();
  var dController = TextEditingController();
  var corretaController = TextEditingController();
  bool carregando = false;
  var corDoTextoDeAviso = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Cadastro de Questões'),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: materiaController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Materia",
                    border: OutlineInputBorder())),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: enunciadoController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite o Enunciado da Quetão",
                    border: OutlineInputBorder())),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: aController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (A)",
                    border: OutlineInputBorder())),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: bController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (B)",
                    border: OutlineInputBorder())),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: cController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (C)",
                    border: OutlineInputBorder())),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: dController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Digite a Alternativa (D)",
                    border: OutlineInputBorder())),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                controller: corretaController,
                style: TextStyle(color: Colors.black),
                maxLength: 1,
                decoration: InputDecoration(
                    labelText: "Digite a Letra da Alternativa Correta! ",
                    border: OutlineInputBorder())),
          ),
          Text(
            aviso,
            style: TextStyle(color: corDoTextoDeAviso),
          ),
          carregando
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.deepPurple,
                      splashColor: Colors.white,
                      elevation: 4.0,
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: cliqueDoBotao,
                    )
                  ],
                ),
        ])));
  }

  void cliqueDoBotao() {
    String materia = materiaController.text;
    String enunciado = enunciadoController.text;
    String A = aController.text;
    String B = bController.text;
    String C = cController.text;
    String D = dController.text;
    String correta = corretaController.text.toUpperCase();
    if (materia.isNotEmpty &&
        enunciado.isNotEmpty &&
        A.isNotEmpty &&
        B.isNotEmpty &&
        C.isNotEmpty &&
        D.isNotEmpty &&
        correta.isNotEmpty) {
      if (correta != "A" &&
          correta != "B" &&
          correta != "C" &&
          correta != "D") {
        setState(() {
          aviso = "Alternativa Invalida";
        });
      } else {
        setState(() {
          aviso = "";
        });
        var listaDeAlternativa = [A, B, C, D];
        int questaoCerta = -1;
        if (correta == "A") {
          questaoCerta = 0;
        }
        if (correta == "B") {
          questaoCerta = 1;
        }
        if (correta == "C") {
          questaoCerta = 2;
        }
        if (correta == "D") {
          questaoCerta = 3;
        }
        setState(() {
          carregando = true;
        });

        Map<String,dynamic> data = {
          "alternativas" : listaDeAlternativa,
          "enunciado" : enunciado,
          "materia" : materia,
          "questaoCerta" : questaoCerta
        };
        Firestore.instance.collection("questoes").document().setData(data).then((ok){
          setState(() {
            carregando = false;
            materiaController.text = "";
            enunciadoController.text = "";
            aController.text = "";
            bController.text = "";
            cController.text = "";
            dController.text = "";
            corretaController.text = "";
            corDoTextoDeAviso = Colors.green;
            aviso = "Cadastrado com Sucesso!!";
          });

        }).catchError((erro){
          print(erro);
        });

      }
    }else{
      setState(() {
        aviso = "Preencha todos os campos!!";
        corDoTextoDeAviso = Colors.red;
      });
    }
  }
}

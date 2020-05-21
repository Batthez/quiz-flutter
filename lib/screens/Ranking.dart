import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  var usuarios;

  RankingScreen(this.usuarios);

  @override
  _RankingScreenState createState() => _RankingScreenState(usuarios);
}

class _RankingScreenState extends State<RankingScreen> {
  List<DocumentSnapshot> usuarios;
  List<Map<String, dynamic>> rank = new List();

  _RankingScreenState(this.usuarios);

  @override
  Widget build(BuildContext context) {
    organizandoListaDeUsuarios();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Ranking",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (BuildContext context, int index) {
            return cadaRank(index);
          },
        )
    );
  }

  Container cadaRank(int posicao) {

    return Container(
      padding: EdgeInsets.all(10.0),
      child:Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Text("${posicao+1}°",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: posicao == 0? Colors.amber : posicao == 1? Colors.grey : posicao == 2? Colors.deepOrangeAccent : Colors.black
              ),),
              SizedBox(width: 6.0,),
              Text(rank[posicao]["nome"],
                style: TextStyle(
                    color: posicao == 0? Colors.amber : posicao == 1? Colors.grey : posicao == 2? Colors.deepOrangeAccent : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20.0,),
              Text("Pontuação: ${rank[posicao]["pontuacao"]}",
                style: TextStyle(),
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
      ),
    );

  }

  void organizandoListaDeUsuarios() {
    for (int i = 0; i < usuarios.length; i++) {
      Map<String, dynamic> dado = {
        "nome": usuarios[i]["nome"],
        "pontuacao": usuarios[i]["pontuacao"]
      };
      rank.add(dado);
    }

    rank.sort((a, b) => a["pontuacao"] > b["pontuacao"] ? 0 : 1);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  var usuarios;
  RankingScreen(this.usuarios);
  @override
  _RankingScreenState createState() => _RankingScreenState(usuarios);
}

class _RankingScreenState extends State<RankingScreen> {
  List<DocumentSnapshot>usuarios;
  List<Map<String,dynamic>>rank;
  _RankingScreenState(this.usuarios);
  @override
  Widget build(BuildContext context) {
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
      ),);
  }
}

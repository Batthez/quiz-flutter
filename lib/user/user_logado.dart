

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Firebase{

  static FirebaseUser usuarioLogado;
  static Map<String,dynamic> dadosDoUsuario;

  static void buscarInformacoes() async{

  }

  static void adicionandoDados(@required double moeda, @required int score, @required VoidCallback onSuccess){
    if(usuarioLogado != null){
      Firestore.instance.collection("users").document(usuarioLogado.uid).get().then((snapshot){
        dadosDoUsuario = snapshot.data;
        dadosDoUsuario["moeda"]+= moeda;
        dadosDoUsuario["pontuacao"] += score;

        Firestore.instance.collection("users").document(usuarioLogado.uid).updateData({
          "moeda" : dadosDoUsuario["moeda"],
          "pontuacao" : dadosDoUsuario["pontuacao"]
        }).then((valor){
          onSuccess;
        });
      });
    }
  }

}
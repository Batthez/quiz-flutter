import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/home_screen.dart';
import 'package:quizapp/screens/sign_up_screen.dart';
import 'package:quizapp/user/user_logado.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String loginValido = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _carregando = false;
  bool _temUsuarioSalvo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 232, 132, 19),
              Color.fromARGB(255, 207, 81, 146)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          padding: EdgeInsets.all(30.0),
          child: Center(
              child: _temUsuarioSalvo
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Card(
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Text(
                                    "Faça seu login ou cadastre-se",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                          labelText: "E-mail",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 0.0, 10.0, 10.0),
                                    child: TextField(
                                      controller: _passController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText: "Senha",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "$loginValido",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  _carregando?
                                      CircularProgressIndicator():
                                  Container(
                                    width: 400.0,
                                    height: 70.0,
                                    padding: EdgeInsets.all(10.0),
                                    child:  RaisedButton(
                                      color:
                                      Theme.of(context).primaryColor,
                                      textColor: Colors.white,
                                      child: Text("Login"),
                                      onPressed: () {
                                        setState(() {
                                          _carregando = true;
                                        });
                                        String email =
                                            _emailController.text;
                                        String senha =
                                            _passController.text;

                                        if (email.contains("@") &&
                                            email.isNotEmpty &&
                                            senha.isNotEmpty &&
                                            senha.length >= 6) {
                                          _auth
                                              .signInWithEmailAndPassword(
                                              email: _emailController
                                                  .text,
                                              password:
                                              _passController
                                                  .text)
                                              .then((user) {
                                            Firebase.usuarioLogado = user;

                                            Firestore.instance
                                                .collection("users")
                                                .document(user.uid)
                                                .get()
                                                .then((user) {
                                              Firebase.dadosDoUsuario =
                                                  user.data;

                                              Navigator.of(context)
                                                  .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                          HomeScreen()));
                                            });
                                          }).catchError((erro) {
                                            setandoErroNoText();
                                          });
                                        } else {
                                          setandoErroNoText();
                                        }
                                      },
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 10.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: FlatButton(
                                      textColor: Colors.red,
                                      child: Text("Cadastre-se >"),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )))),
    );
  }

  void setandoErroNoText() {
    setState(() {
      loginValido = "E-mail ou senha inválidos";
      _carregando = false;
    });
  }

  bool verificacaoDosCampos(String text) {
    return text.isNotEmpty;
  }
}

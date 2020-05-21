import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:QuizApp_G11/screens/home_screen.dart';
import 'package:QuizApp_G11/user/user_logado.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String validador = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 232, 132, 19),
                  Color.fromARGB(255, 207, 81, 146)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          padding: EdgeInsets.all(30.0),
          child: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          child:  Column(
                            children: <Widget>[
                              SizedBox(height: 50.0,),
                              Text(
                                "Cadastro",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 40.0,),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child:  TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      labelText: "Nome",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      )

                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      labelText: "E-mail",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      )

                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child:  TextField(
                                  controller: _passController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: "Senha",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      )

                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0,),
                             Container(
                               padding: EdgeInsets.all(10.0),
                               child:  Text(
                                 "$validador",
                                 style: TextStyle(
                                     color: Colors.red
                                 ),
                               ),
                             ),

                              _isLoading
                                  ?
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: CircularProgressIndicator(),
                                  )
                                  :
                              Container(
                                width: 400.0,
                                padding: EdgeInsets.all(10.0),
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  child: Text("Cadastrar"),
                                  onPressed: cliqueDoBotao,
                                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  )
              )
          )
      ),

    );
  }

  void cliqueDoBotao(){

    if(camposOk()){
      setState(() {
        _isLoading = true;
      });
      _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text)
          .then((user){
        Map<String, dynamic> data = {
          "email" : _emailController.text,
          "moeda" : 0.0,
          "nome" : _nameController.text,
          "pontuacao": 0,
          "tipoUsuario" : 0
        };
        Firebase.usuarioLogado = user;

        _criandoUsuario(data,user);

      }).catchError((erro){
        setState(() {
          _isLoading = false;
          validador = "E-mail já em uso";
        });
      });
    }else{
      setState(() {
        validador = "Informações incorretas! Cheque se campos estão vazios ou se a senha tem menos de 6 caracteres.";
      });
    }


  }

  void _criandoUsuario(Map<String,dynamic> data, FirebaseUser user){
    Firestore.instance.collection("users").document(user.uid).setData(data).then((a){
      setState(() {
        _isLoading = false;
      });
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
    }).catchError((erro){
      setState(() {
        validador = erro;
        _isLoading = false;
      });
    });
  }

  bool camposOk(){

    String nome = _nameController.text;
    String email = _emailController.text;
    String senha = _passController.text;

    return nome.isNotEmpty && email.isNotEmpty && senha.isNotEmpty && email.contains("@")
            && senha.length >= 6;

  }
}


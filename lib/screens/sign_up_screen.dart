import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                                  obscureText: true,
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
                                  decoration: InputDecoration(
                                      labelText: "Senha",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      )

                                  ),
                                ),
                              ),                              SizedBox(height: 15.0,),
                              Container(
                                width: 400.0,
                                padding: EdgeInsets.all(10.0),
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  child: Text("Cadastrar"),
                                  onPressed: (){
                                  },
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
}

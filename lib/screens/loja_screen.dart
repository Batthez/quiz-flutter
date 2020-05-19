import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class LojaScreen extends StatefulWidget {
  LojaScreen({Key key}) : super(key: key);
  @override
  _LojaScreenState createState() => _LojaScreenState();
}


class _LojaScreenState extends State<LojaScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Colocar as vantagens como, eliminar alternativas ou pular questoes na forma de botoes',
      style: optionStyle,
    ),
    Text(
      'Os temas diferentes pra o perfil',
      style: optionStyle,
    ),
    Text(
      'Tela de cadastro',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("   Loja         ",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    padding:
                    const EdgeInsets.fromLTRB(4.0, 6.0, 1.0, 0.0),
                    color: Color.fromRGBO(208, 177, 155, 200),
                    child: Text( "Coins: xxxx",
                        style:
                        TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0))
                )
              ],
              centerTitle: true,
              backgroundColor: Colors.deepPurple,

              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {
                      Navigator.pop(context);
                    });
                },
              ),

            ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),

              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.call_split),
                    title: Text('Vantagens'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.format_paint),
                    title: Text('Temas'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle),
                    title: Text('Cadastro'),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.deepPurple,
                onTap: _onItemTapped,
              ));


              }
}

//------------------------------------------------------------------------------


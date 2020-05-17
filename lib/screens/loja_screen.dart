import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quizapp/screens/home_screen.dart';


class HomeScreen extends StatelessWidget {
  static const String _title = 'Flutter Code ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Colocar as vantagens como, eliminar alternativas ou pular questoes na forma de botoes',
      style: optionStyle,
    ),
    Text(
      'Avatares, se tiver',
      style: optionStyle,
    ),
    Text(
      'Os temas diferentes pra o perfil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//-----------------------------------------------------
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
                      setState(() {Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
                    });
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
                    icon: Icon(Icons.accessibility),
                    title: Text('Avatar'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.format_paint),
                    title: Text('Temas'),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.deepPurple,
                onTap: _onItemTapped,
              ));


              }
}

//------------------------------------------------------------------------------

class LojaScreen extends StatefulWidget {
  @override
  _LojaScreenState createState() => _LojaScreenState();
}

class _LojaScreenState extends State<LojaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Loja",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }

}
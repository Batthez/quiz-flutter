import 'package:flutter/material.dart';
import 'package:quizapp/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

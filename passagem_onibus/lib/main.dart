import 'package:flutter/material.dart';
import 'package:passagem_onibus/Pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        /* appBar: AppBar(
          title: Text('App de Ônibus'),
        ), */
        body: SingleChildScrollView(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

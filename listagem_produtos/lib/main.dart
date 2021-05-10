import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listagem_produtos/pages/HomeScrenn/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePageScreen(),
      ),
    );
  }
}

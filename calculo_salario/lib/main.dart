import 'package:calculo_salario/container_default.dart';
import 'package:calculo_salario/menu.dart';
import 'package:flutter/material.dart';

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
      home: ContainerDefault(
        title: Text('Calculo Salario'),
        child: MenuScreen(),
      ),
    );
  }
}

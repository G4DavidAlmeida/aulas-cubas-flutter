import 'package:flutter/material.dart';
import 'package:passagem_onibus/Components/PassageiroItem.dart';
import 'package:passagem_onibus/Components/rounded_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return PassageiroItem();
              },
            ),
          ),
          RoundedButton(
            text: 'ADICIONAR PASSAGEIRO',
            press: () {},
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}

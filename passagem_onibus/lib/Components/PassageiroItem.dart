import 'package:flutter/material.dart';
import 'package:passagem_onibus/Constants.dart';
import 'package:passagem_onibus/Database/Passageiro.dart';

class PassageiroItem extends StatelessWidget {
  const PassageiroItem({
    Key key,
    @required this.passageiro,
  }) : super(key: key);

  final Passageiro passageiro;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Passageiro ${passageiro.nome}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FieldItem(text: 'Nome: ${passageiro.nome}'),
              FieldItem(text: 'Idade: ${passageiro.idade}'),
              FieldItem(text: 'CPF: ${passageiro.cpf}'),
              FieldItem(text: 'Valor da passagem: ${passageiro.valorPassagem}')
            ],
          )
        ],
      ),
    );
  }
}

class FieldItem extends StatelessWidget {
  const FieldItem({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kBlueLightColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text),
    );
  }
}

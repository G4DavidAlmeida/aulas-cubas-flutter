import 'package:flutter/material.dart';
import 'package:passagem_onibus/Constants.dart';
import 'package:passagem_onibus/Components/rounded_button.dart';
import 'package:passagem_onibus/Components/rounded_input_field.dart';
import 'package:passagem_onibus/Database/Passageiro.dart';

class FormClientPage extends StatefulWidget {
  @override
  _FormClientPageState createState() => _FormClientPageState();
}

class _FormClientPageState extends State<FormClientPage> {
  String _nome;
  String _cpf;
  int _idade;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedInputField(
                hintText: 'Nome',
                onChanged: (value) {
                  setState(() {
                    _nome = value;
                  });
                },
              ),
              RoundedInputField(
                hintText: 'CPF',
                onChanged: (value) {
                  setState(() {
                    _cpf = value;
                  });
                },
              ),
              RoundedInputField(
                hintText: 'Idade',
                onChanged: (value) {
                  setState(() {
                    _idade = int.parse(value);
                  });
                },
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: 'Criar novo passageiro',
                press: () {
                  Passageiro obj = new Passageiro(_nome, _cpf, _idade);
                  obj.save().then((value) => Navigator.pop(context));
                },
              ),
              RoundedButton(
                text: 'Cancelar',
                color: kRedLightColor,
                press: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

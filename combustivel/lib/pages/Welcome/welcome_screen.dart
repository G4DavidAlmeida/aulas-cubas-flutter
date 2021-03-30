import 'package:combustivel/pages/Welcome/components/rounded_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _result = 'Não computado';
  double _gasolina;
  double _alcool;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    _gasolina = double.parse(value.replaceAll(',', '.'));
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite o valor da gasolina',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    _alcool = double.parse(value.replaceAll(',', '.'));
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite o valor da alcool',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: 'Calcular',
                press: () {
                  setState(() {
                    if (_alcool / _gasolina < 0.7) {
                      _result = 'Alcool é mais econômico';
                    } else {
                      _result = 'Gasolina é mais econômico';
                    }
                  });
                },
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(height: size.height * 0.02),
              Text('resultado: $_result'),
            ],
          ),
        ),
      ),
    );
  }
}

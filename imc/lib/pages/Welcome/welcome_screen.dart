import 'package:flutter/material.dart';
import 'package:imc/pages/Welcome/components/rounded_button.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _result = 'Não computado';
  double _peso;
  double _altura;
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
                    _peso = double.parse(value.replaceAll(',', '.'));
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite seu peso',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    _altura = double.parse(value.replaceAll(',', '.'));
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Digite sua altura',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: 'Calcular',
                press: () {
                  setState(() {
                    double imc = _peso * _altura * _altura;
                    if (imc < 17) {
                      _result = 'Muito a baixo do peso';
                    } else if (imc < 18.49) {
                      _result = 'Abaixo do peso';
                    } else if (imc < 24.99) {
                      _result = 'Peso normal';
                    } else if (imc < 29.99) {
                      _result = 'Acima do peso';
                    } else if (imc < 34.99) {
                      _result = 'Obesidade I';
                    } else if (imc < 39.99) {
                      _result = 'Obesidade II (severa)';
                    } else {
                      _result = 'Obesidade III (mórbida)';
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

import 'package:calculo_salario/calculate_screen.dart';
import 'package:calculo_salario/custom_input.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  double _horas;
  double _salario_hora;
  int _dependentes;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 50),
      height: size.height * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            hintText: 'Digite as horas trabalhadas',
            onchange: (value) {
              setState(() {
                _horas = double.parse(value.replaceAll(",", "."));
              });
            },
          ),
          SizedBox(height: size.height * 0.05),
          CustomButton(
            hintText: 'Digite o salário horá',
            onchange: (value) {
              setState(() {
                _salario_hora = double.parse(value.replaceAll(",", "."));
              });
            },
          ),
          SizedBox(height: size.height * 0.05),
          CustomButton(
            hintText: 'Insira o total de dependentes',
            onchange: (value) {
              setState(() {
                _dependentes = int.parse(value);
              });
            },
          ),
          SizedBox(height: size.height * 0.1),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CalculateScreen(
                      horas: _horas,
                      salario_hora: _salario_hora,
                      dependentes: _dependentes,
                    );
                  },
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            ),
            child: Text(
              'Calcular',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

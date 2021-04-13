import 'package:calculo_salario/container_default.dart';
import 'package:calculo_salario/display.dart';
import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  final double horas;
  final double salario_hora;
  final int dependentes;

  const CalculateScreen({
    Key key,
    @required this.horas,
    @required this.salario_hora,
    @required this.dependentes,
  }) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  double _salario_bruto;
  double _desconto_inss;
  double _desconto_ir;
  double _salarario_liquido;

  void calculate() {
    setState(() {
      _salario_bruto =
          widget.horas * widget.salario_hora + (50 * widget.dependentes);

      _desconto_inss = _salario_bruto * (_salario_bruto <= 100 ? 8.5 : 9) / 100;
      if (_salario_bruto <= 500) {
        _desconto_ir = 0;
      } else if (_salario_bruto <= 1000) {
        _desconto_ir = _salario_bruto * 5 / 100;
      } else {
        _desconto_ir = _salario_bruto * 7 / 100;
      }
      _salarario_liquido = _salario_bruto - _desconto_inss - _desconto_ir;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.calculate();
    Size size = MediaQuery.of(context).size;
    return ContainerDefault(
      title: Text('Calculo Salario'),
      child: Container(
        height: size.height * 0.85,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Display(text: "Salário Bruto: R\$ $_salario_bruto"),
            SizedBox(height: size.height * 0.05),
            Display(text: "Desconto INSS: R\$ $_desconto_inss"),
            SizedBox(height: size.height * 0.05),
            Display(text: "Desconto IR: R\$ $_desconto_ir"),
            SizedBox(height: size.height * 0.05),
            Display(text: "Salário Líquido: R\$ $_salarario_liquido"),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}

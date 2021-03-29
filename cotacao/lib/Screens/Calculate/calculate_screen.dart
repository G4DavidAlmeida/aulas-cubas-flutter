import 'package:cotacao/Screens/Calculate/Background.dart';
import 'package:cotacao/Screens/Calculate/components/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CalculateScreen extends StatefulWidget {
  final double price;

  const CalculateScreen({
    Key key,
    @required this.price,
  }) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  double _dolar;
  double _euro;
  double _libra;

  Future<void> cotation() async {
    var client = http.Client();
    http.Response response;
    try {
      var url = Uri.parse(
          'https://economia.awesomeapi.com.br/json/all/USD-BRL,EUR-BRL,GBP-BRL');
      response = await http.get(url);
    } finally {
      client.close();
    }
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        _dolar = double.parse(jsonResponse['USD']['high']) * widget.price;
        _euro = double.parse(jsonResponse['EUR']['high']) * widget.price;
        _libra = double.parse(jsonResponse['GBP']['high']) * widget.price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    cotation();
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/calc.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.05),
            Display(
              text: 'Em dolar: ${_dolar.toStringAsFixed(2)}',
              icon: Icons.attach_money_outlined,
            ),
            SizedBox(height: size.height * 0.03),
            Display(
              text: 'Em Euro: ${_euro.toStringAsFixed(2)}',
              icon: Icons.attach_money_outlined,
            ),
            SizedBox(height: size.height * 0.03),
            Display(
              text: 'Em Libra: ${_libra.toStringAsFixed(2)}',
              icon: Icons.euro_outlined,
            )
          ],
        ),
      ),
    );
  }
}

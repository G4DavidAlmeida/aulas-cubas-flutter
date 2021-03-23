import 'package:cotacao/Screens/Calculate/Background.dart';
import 'package:cotacao/Screens/Calculate/components/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                text: 'Valor: ${widget.price}',
                icon: Icons.attach_money_outlined),
            SizedBox(height: size.height * 0.03),
            Display(
                text: 'Em dolar: ${widget.price}',
                icon: Icons.attach_money_outlined),
            SizedBox(height: size.height * 0.03),
            Display(text: 'Em Euro: ${widget.price}', icon: Icons.euro_outlined)
          ],
        ),
      ),
    );
  }
}

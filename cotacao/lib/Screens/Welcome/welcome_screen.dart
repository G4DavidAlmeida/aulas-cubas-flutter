import 'package:cotacao/Screens/Calculate/calculate_screen.dart';
import 'package:cotacao/components/rounded_button.dart';
import 'package:cotacao/components/rounded_input_number_field.dart';
import 'package:cotacao/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _price = 0;
  void _setPrice(double value) {
    setState(() {
      _price = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/bank.svg",
                height: size.height * 0.3,
              ),
              SizedBox(height: size.height * 0.07),
              RoundedInputFieldNumber(
                hintText: 'Digite o valor',
                icon: Icons.attach_money_rounded,
                onChanged: (value) {
                  _setPrice(double.parse(value));
                },
              ),
              SizedBox(height: size.height * 0),
              RoundedButton(
                color: kPrimaryLighColor,
                text: "CALCULAR",
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CalculateScreen(
                          price: _price,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cotacao/components/rounded_button_go_back.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 5,
            child: RoundedButtonGoBack(size: size),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: child,
          ),
        ],
      ),
    );
  }
}

import 'package:cotacao/contants.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kLightColor,
      ),
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kPrimaryLighColor,
            size: 25,
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

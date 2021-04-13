import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;

  const Display({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      width: size.width * 0.85,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.lightBlue),
        borderRadius: BorderRadius.circular(29),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final onchange;
  final hintText;

  const CustomButton({
    Key key,
    this.onchange,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

import 'package:cotacao/contants.dart';
import 'package:flutter/material.dart';

class RoundedButtonGoBack extends StatelessWidget {
  const RoundedButtonGoBack({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_outlined,
              color: kPrimaryLighColor,
              size: size.width * 0.1,
            ),
            SizedBox(width: size.width * 0.02),
            Text(
              "Voltar",
              style: TextStyle(
                color: kPrimaryLighColor,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

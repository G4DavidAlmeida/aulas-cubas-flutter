import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  final Widget children;

  const BackgroundHome({
    Key key,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              height: size.height,
              child: children,
            ),
          ),
          Positioned(
            bottom: size.height * 0.05,
            right: size.height * 0.05,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

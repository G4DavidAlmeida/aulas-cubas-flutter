import 'package:flutter/material.dart';

class ContainerDefault extends StatelessWidget {
  final Widget title;
  final Widget child;

  const ContainerDefault({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}

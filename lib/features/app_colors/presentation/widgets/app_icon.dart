import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double? side;

  const AppIcon({
    Key? key,
    this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/icon.png',
      width: side,
      height: side,
    );
  }
}

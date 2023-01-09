import 'dart:ui';

import 'package:flutter/material.dart';

class LabeledContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color textColor;
  final String text;
  final Color myColor;

  const LabeledContainer({
    Key? key,
    this.width = 150.0,
    this.height = double.infinity,
    this.myColor = Colors.blue,
    required this.text,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: myColor,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      ),
    );
  }
}

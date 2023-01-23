import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stopwatch/labeled_container.dart';

class PageTwo extends StatelessWidget {
  final Color myColr;
  final String colrName;
  const PageTwo({required this.myColr, required this.colrName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LabeledContainer(text: colrName),
        ],
      ),
    );
  }
}

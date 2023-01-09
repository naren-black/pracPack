// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DeepTree extends StatelessWidget {
  // const DeepTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Naari again!'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  Text('Very first line here!'),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  Text('All widgets everywhere!'),
                ],
              ),
              Text('Finally the last line.'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import './profile_screen.dart';
// import './flex_screen.dart';
// import './deep_tree.dart';
import './e_commerce_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ECommerceScreen(),
    );
  }
}

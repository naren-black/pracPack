import 'package:flutter/material.dart';
import './stopwatch.dart';
import './login_screen.dart';
import './page_1.dart';

void main() {
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        Stopwatch.route: (context) => Stopwatch(),
      },
      // initialRoute: '/',
      title: 'Stopwatch App',
      home: LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:layout_prac/immutable_widget.dart';
import './text_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Center(child: Text('Naren AppBar')),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // const AspectRatio(
          //   aspectRatio: 1,
          //   child: ImmutableWidget(),
          // ),
          Image.asset('assets/beach.jpeg'),
          const TextLayout(),
          const Divider(),
          RichText(
            text: const TextSpan(
              text: 'Flutter text is: ',
              style: TextStyle(fontSize: 22, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'really ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  children: [
                    TextSpan(
                      text: 'powerful.',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: const Center(
            child: Text('I am being drawn...'),
          ),
        ),
      ),
    );
  }
}

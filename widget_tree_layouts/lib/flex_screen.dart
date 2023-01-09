// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:widget_tree_layouts/labeled_container.dart';

class FlexScreen extends StatelessWidget {
  // const FlexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text('Widgets Expanded and Flexible'),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ..._header(context, 'Expanded'),
            _buildExpanded(context),
            // Spacer(),
            ..._header(context, 'Flexible'),
            _buildFlexible(context),
            // Expanded(child: Container()),
            Spacer(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Iterable<Widget> _header(BuildContext context, String methy) {
    return [
      const SizedBox(height: 20),
      Text(
        methy,
        style: Theme.of(context).textTheme.headline5,
      ),
    ];
  }

  Widget _buildExpanded(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          LabeledContainer(
            width: 100,
            // myColor: Colors.green,
            text: '100',
          ),
          Expanded(
              child: LabeledContainer(
            myColor: Colors.purple,
            text: 'Default 40 width!',
            // textColor: Colors.white,
          )),
          LabeledContainer(
            myColor: Colors.green,
            text: '40',
          )
        ],
      ),
    );
  }

  Widget _buildFlexible(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: LabeledContainer(
              text: '100 width',
              width: 100.0,
              myColor: Colors.yellowAccent,
            ),
          ),
          Flexible(
            flex: 1,
            child: LabeledContainer(
              text: 'Ye dear 50',
              width: 50.0,
              myColor: Colors.green,
            ),
          ),
          Flexible(
            flex: 2,
            child: LabeledContainer(text: 'Default 150 width'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 30,
          ),
          child: Text(
            'I am at the bottom',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

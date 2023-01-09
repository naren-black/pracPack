// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ECommerceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _buildToggleBar(),
            Image.asset('assets/woman_shopping.jpg'),
            DealButtons(),
            _buildProductTile(context),
          ],
        ),
      ),
    );
  }

  Container _buildProductTile(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/textiles.jpg',
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lorem Ipsum',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text(
                      'Dolor sit amet, consectetur adipiscing elit. Quisque faucibus.')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildToggleBar() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'Recommended',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'Formal Wear',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'Casual Wear',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purpleAccent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      leading: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Icon(Icons.home),
      ),
      title: const Text('Let\'s go shopping!'),
      elevation: 0,
      actions: <Widget>[
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}

class DealButtons extends StatelessWidget {
  // const DealButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        Row(
          children: <Widget>[
            const DealButton(
              myColor: Colors.orangeAccent,
              myText: 'Best Sellers',
            ),
            const SizedBox(
              width: 10,
            ),
            const DealButton(
              myColor: Colors.indigoAccent,
              myText: 'Daily Deals',
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: <Widget>[
            const DealButton(
              myColor: Colors.lightGreen,
              myText: 'Must buy in summer',
            ),
            const SizedBox(width: 10),
            const DealButton(
              myColor: Colors.redAccent,
              myText: 'Last Chance',
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class DealButton extends StatelessWidget {
  final String? myText;
  final Color? myColor;
  // final key = GlobalKey();

  const DealButton({this.myColor, this.myText}) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: myColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          myText!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}

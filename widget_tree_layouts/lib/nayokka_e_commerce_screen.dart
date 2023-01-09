// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ECommerceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('Let\'s go shopping'),
        backgroundColor: Colors.purpleAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(Icons.home),
        ),
        elevation: 0,
        actions: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Formal Wear',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Casual Wear',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/woman_shopping.jpg'),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Best Sellers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Daily Deals',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Must buy in summer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Last Chance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 200,
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
                                  'Dolor sit amet, consectetur adipiscing elit. Quisque faucibus.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

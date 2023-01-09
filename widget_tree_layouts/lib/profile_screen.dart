import 'package:flutter/material.dart';
import './star.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Yo Naari is back!'),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/beach.jpeg'),
          Transform.translate(
            offset: const Offset(0, 150),
            child: Column(
              children: <Widget>[
                _buildProfileImage(context),
                _buildProfileDetails(context),
                _buildActions(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: ClipOval(
        child: Image.asset(
          'assets/dog.jpeg',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Center(
            child: Text(
              'Worlfram Barkovich',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 100),
            child: StarRating(value: 5),
          )),
          _buildDetailsRow('Age', '4'),
          _buildDetailsRow('Status', 'Good Boy'),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(Icons.restaurant, 'Feed'),
        _buildIcon(Icons.favorite, 'Pet'),
        _buildIcon(Icons.directions_walk, 'Walk'),
      ],
    );
  }

  Widget _buildIcon(IconData icy, String mess) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(icy, size: 40),
          Text(mess),
        ],
      ),
    );
  }

  Widget _buildDetailsRow(String heading, value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$heading: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('$value'),
        ],
      ),
    );
  }
}

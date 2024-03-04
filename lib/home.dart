import 'package:flutter/material.dart';
import 'package:loyalty_app/card_screen.dart';
import 'package:loyalty_app/profile_screen.dart';
import 'package:loyalty_app/reward_screen.dart';

import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
        actions: [
          // Add other action icons if needed
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // go to the login screen
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Hi, Melissa',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12, bottom: 10),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie eleifend lacus ac faucibus.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: <Widget>[
                  _buildGridItem(context, Icons.monetization_on, 'Rewards'),
                  _buildGridItem(context, Icons.credit_card, 'Show Card'),
                  _buildGridItem(context, Icons.history, 'History'),
                  _buildGridItem(context, Icons.person, 'Profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData iconData, String title) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Rewards':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RewardScreen()));
            break;
          case 'Show Card':
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CardScreen()));
            break;
          case 'History':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryScreen()));
            break;
          case 'Profile':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
            break;
          default:
            print('Unknown Grid Item');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, size: 50, color: Colors.white),
            SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

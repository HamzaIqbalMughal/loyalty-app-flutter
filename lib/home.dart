import 'package:flutter/material.dart';

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
                  _buildGridItem(Icons.monetization_on, 'Rewards'),
                  _buildGridItem(Icons.credit_card, 'Show Card'),
                  _buildGridItem(Icons.history, 'History'),
                  _buildGridItem(Icons.person, 'Profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData iconData, String title) {
    return Container(
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
    );
  }
}

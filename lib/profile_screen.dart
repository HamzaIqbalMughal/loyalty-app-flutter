import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            color: Colors.blueAccent.withOpacity(0.25),
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                // Place user's image here
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Melissa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Loyalty Available',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '34,00 USD',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle level button press
              },
              child: Text('Your are now on Level 1'),
            ),
            SizedBox(height: 16),
            LevelIndicator(title: 'Level 1', loyalty: '5% Loyalty'),
            LevelIndicator(title: 'Level 2', loyalty: '10% Loyalty'),
            LevelIndicator(title: 'Level 3', loyalty: '15% Loyalty'),
            LevelIndicator(title: 'Level 4', loyalty: '20% Loyalty'),
          ],
        ),
      ),
    );
  }
}

class LevelIndicator extends StatelessWidget {
  final String title;
  final String loyalty;

  const LevelIndicator({Key? key, required this.title, required this.loyalty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text(loyalty),
      onTap: () {
        // Handle level indicator tap
      },
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Add path segments to create a custom shape for the AppBar background
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Home Screen',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              )),

          SizedBox(
            height: 50,
          ),

          // elevated button to navigate to the login screen
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          child: SvgPicture.asset(
            "assets/appbar_image.svg",
            // height: 400,
            // width: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          top: 30,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            itemCount: 5, // Replace with your actual count of items
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('\$53.65'),
                subtitle: Text('Tiffany Ang\n16 March, 2020'),
                trailing: Chip(
                  label: Text('Completed'),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

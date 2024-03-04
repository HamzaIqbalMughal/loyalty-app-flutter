import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/home.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
        child: AppBar(
          flexibleSpace: SvgPicture.asset(
            "assets/appbar_image.svg",
            // height: 400,
            // width: 400,
            width: MediaQuery.of(context).size.width,
          ),
          // Set elevation to 0 to remove the shadow
          elevation: 0,
        ),
      ),
      body: Column(children: [
        // Positioned(
        //   top: 0,
        //   child:
        // ),
        // Positioned(
        //   top: 30,
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: InkWell(
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HomeScreen()));
        //         },
        //         child: Icon(Icons.arrow_back)),
        //   ),
        // ),
        // ListView.builder(
        //   itemCount: 5, // Replace with your actual count of items
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text('\$53.65'),
        //       subtitle: Text('Tiffany Ang\n16 March, 2020'),
        //       trailing: Chip(
        //         label: Text('Completed'),
        //         backgroundColor: Colors.green,
        //       ),
        //     );
        //   },
        // ),
      ]),
    );
  }
}

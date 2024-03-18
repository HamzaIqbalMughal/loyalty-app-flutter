import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Service/transaction_history_service.dart';
import 'package:loyalty_app/home_screen.dart';
import 'package:loyalty_app/model/transaction_model.dart';
import 'package:loyalty_app/reward_screen.dart';
import 'package:http/http.dart' as http;


class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getTransactions();
  }

  /*
  void getTransactions() async {
    transactionList = await TransactionHistoryService().getTransactions();
    for (var transaction in transactionList) {
      print('Transaction ID: ${transaction.id}');
      print('User ID: ${transaction.userId}');
      print('Item Name: ${transaction.itemName}');
      print('Price: ${transaction.price}');
      print('Transaction Date: ${transaction.transactionDate}');
      print('Version: ${transaction.v}');
      print('Full Name: ${transaction.fullName}');
      print('\n');
    }
  }

   */

  String url = 'https://loyality-app-backend.vercel.app/api/transaction/transaction-history';
  List<TransactionModel> transactionsList = [];

  Future<List<TransactionModel>> getTransactions() async {
    try{
      final response = await http.get(Uri.parse(url), headers: {'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjIyZmY5MDM2ZTE3MmRhNjJmZmU4ZCIsInVzZXJuYW1lIjoic2FqaWRiaGF0dGlAZ21haWwuY29tIiwiaWF0IjoxNzEwMzcwOTM1fQ.yPZuPzoRfiE5C2hgrQefA74jAzaG8uzrPnfvzyS3wo0'});
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        transactionsList.clear();
        for(Map i in data['transactionHistory']){
          transactionsList.add(TransactionModel.fromJson(i));
        }
        // print(transactionsList[0].toString());
        return transactionsList;
      } else {
        kDebugMode ? print('error while fetching') : null;
      }
    }catch(e){
      kDebugMode ? print('from catch block'+e.toString()) : null;
    }
    return transactionsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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

            // text box
            Positioned(
              top: 300,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(children: [
                    Text(
                      'History',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    // SizedBox(height: 16),
                    // Add a ListView here
                    // Replace this ListView with your content
                    // ListView(children: [Text('Item 1'), Text('Item 2')

                    Expanded(
                        child: FutureBuilder(
                            future: TransactionHistoryService().getTransactions(),
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                return ListView.builder(
                                    itemCount: transactionsList.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("500\$",
                                                style:
                                                TextStyle(fontSize: 20, color: Colors.black)),
                                            Text("Project Name",
                                                style:
                                                TextStyle(fontSize: 22, color: Colors.black)),
                                            Chip(
                                              label: Text("Completed",
                                                  style:
                                                  TextStyle(fontSize: 16, color: Colors.black)),
                                              color: MaterialStateColor.resolveWith(
                                                      (states) => Colors.green),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                );
                              }else{
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                );
                              }
                            }
                        )
                    ),

                    /*
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("500\$",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text("Project Name",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Chip(
                          label: Text("Completed",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("500\$",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text("Project Name",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Chip(
                          label: Text("Completed",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("500\$",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text("Project Name",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Chip(
                          label: Text("Completed",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("500\$",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text("Project Name",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Chip(
                          label: Text("Completed",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.green),
                        ),
                      ],
                    ),

                    */
                  ]),
                ),
              ),
            ),
          ]),
    );
  }
}

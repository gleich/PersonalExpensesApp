import 'package:flutter/material.dart';

import './transaction.dart';
import './coreWidgets/transactionCard.dart';
import './coreWidgets/input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: "New Video Game",
      amount: 59.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.black,
              child: Text(
                "CHART!",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 5,
            ),
            TransactionInput(),
            Column(
              children: <Widget>[
                ...transactions.map(
                  (tx) {
                    return TranactionCard(tx: tx,);
                  }
                ).toList()
              ],
            )
          ],
        ));
  }
}

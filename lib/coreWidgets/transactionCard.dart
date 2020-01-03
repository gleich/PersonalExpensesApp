import 'package:flutter/material.dart';
import './../transaction.dart';

class TranactionCard extends StatelessWidget {
  final Transaction tx;

  TranactionCard({@required this.tx});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            padding: EdgeInsets.all(10),
            child: Text(tx.amount.toString()),
          ),
          Column(
            children: <Widget>[Text(tx.title), Text(tx.date.toString())],
          )
        ],
      ),
    );
  }
}

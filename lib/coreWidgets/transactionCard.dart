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
            child: Text(
              tx.amount.toString()
            ),
          ),
          Column(
            children: <Widget>[
              Text(tx.title),
              Text(tx.date.toString())
            ],
          )
        ],
      ),
    );
  }
}

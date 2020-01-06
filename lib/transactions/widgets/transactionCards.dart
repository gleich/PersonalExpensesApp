import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

class TranactionCards extends StatelessWidget {
  final List<Transaction> trasactions;
  TranactionCards(this.trasactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...trasactions.map(
          (tx) {
            return Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "\$${tx.amount}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

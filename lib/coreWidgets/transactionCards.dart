import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

class TranactionCard extends StatefulWidget {
  final Transaction tx;

  TranactionCard({@required this.tx});

  @override
  _TranactionCardState createState() => _TranactionCardState();
}

class _TranactionCardState extends State<TranactionCard> {
  @override
  Widget build(BuildContext context) {
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
              "\$${widget.tx.amount}",
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
                widget.tx.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMd().format(widget.tx.date),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onChanged: (String val) => titleInput = val,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  labelText: "Transaction Amount",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (String val) => amountInput = val,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  labelText: "Amount",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.green,
              onPressed: () => print(titleInput),
            )
          ],
        ),
      ),
    );
  }
}

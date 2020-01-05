import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  labelText: "Transaction Title",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  labelText: "Amount",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.green,
              onPressed: () =>
                  print(titleController.text + " " + amountController.text),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final Function addTx;
  TransactionInput(this.addTx);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
              onPressed: () => addTx(
                  titleController.text, double.parse(amountController.text)),
            )
          ],
        ),
      ),
    );
  }
}

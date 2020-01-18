import 'package:flutter/material.dart';

class TransactionInput extends StatefulWidget {
  final Function addTx;
  TransactionInput(this.addTx);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  labelText: "Transaction Title",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  labelText: "Amount",
                  labelStyle: TextStyle(color: Colors.black)),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.green,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}

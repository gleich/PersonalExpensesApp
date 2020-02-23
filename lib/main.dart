import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/transactions/widgets/transactionCards.dart';

import './transactions/widgets/input.dart';
import './transactions/models/transaction.dart';
import './transactions/widgets/chart.dart';

void main() {
  // Lock orientation:
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 21.5,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "N/A", title: "something", amount: 10, date: DateTime.now()),
    // Transaction(
    //     id: "N/A", title: "something", amount: 10, date: DateTime.now()),
    // Transaction(
    //     id: "N/A", title: "something", amount: 10, date: DateTime.now()),
    // Transaction(
    //     id: "N/A", title: "something", amount: 10, date: DateTime.now()),
    // Transaction(
    //     id: "N/A", title: "something", amount: 10, date: DateTime.now()),
    // Transaction(
    //     id: "N/A", title: "something", amount: 10, date: DateTime.now()),
    // Transaction(id: "N/A", title: "something", amount: 10, date: DateTime.now())
  ];

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(
      () {
        _userTransactions.add(newTx);
      },
    );
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionInput(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        _userTransactions.removeWhere((tx) => tx.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      backgroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Switch(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              },
            ),
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) *
                        0.7,
                    child: Chart(_recentTransactions),
                  )
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) *
                        0.70,
                    child: TranactionCards(
                      _userTransactions,
                      _deleteTransaction,
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => _startAddNewTransaction(context),
              backgroundColor: Colors.black,
            ),
    );
  }
}

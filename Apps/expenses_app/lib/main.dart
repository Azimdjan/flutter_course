import 'dart:io';

import 'package:expenses_app/widgets/chartWidget.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transactionList.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
      home: ExpensesApp(),
    );
  }
}

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({Key key}) : super(key: key);

  @override
  _ExpensesAppState createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Transaction> transactions = [];
  bool _isChart = false;

  void _addTransaction(String title, double amount, DateTime choosenDate) {
    final newTr = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      time: choosenDate,
    );

    setState(() {
      transactions.add(newTr);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => id == element.id);
    });
  }

  List<Transaction> get recentTransaction {
    return transactions
        .where(
          (tr) => tr.time.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text("Expenses App"),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context)),
      ],
    );
    final transactionList = Container(
      height: MediaQuery.of(context).size.height * 0.6 -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top,
      child: TransactionList(transactions, deleteTransaction),
    );
    return Scaffold(
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show chart!"),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _isChart,
                    onChanged: (val) {
                      setState(() {
                        _isChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (isLandscape)
              _isChart
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.7 -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top,
                      child: ChartWidget(recentTransaction),
                    )
                  : transactionList,
            if (!isLandscape)
              Container(
                height: MediaQuery.of(context).size.height * 0.4 -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top,
                child: ChartWidget(recentTransaction),
              ),
            if (!isLandscape) transactionList,
          ],
        ),
      ),
    );
  }
}

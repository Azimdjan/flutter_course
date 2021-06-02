import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions,this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions were added!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                  elevation: 6,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FittedBox(
                              child: Text(
                            "\$${transactions[index].amount.toStringAsFixed(2)}",
                          )),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMEd().format(transactions[index].time),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
                        onPressed: () => deleteTransaction(transactions[index].id),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}

import 'package:expenses_app/models/chart.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const ChartWidget(this.recentTransaction);

  List<Chart> get groupTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.0;

      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].time.day == weekDay.day &&
            recentTransaction[i].time.month == weekDay.month &&
            recentTransaction[i].time.year == weekDay.year)
          totalAmount += recentTransaction[i].amount;
      }

      return Chart(
          day: DateFormat.E().format(weekDay),
          totalAmount: totalAmount);
    });
  }

  double percentage(double val) {
    double temp = recentTransaction.fold(0.0, (sum, tr) => sum += tr.amount);
    if (temp <= 0)
      return 0;
    else
      return val/temp;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransaction.map((e) {
            return Flexible(
                fit: FlexFit.tight,
                child: Chart_Bar(
                    e.day, e.totalAmount, percentage(e.totalAmount)));
          }).toList(),
        ),
      ),
    );
  }
}

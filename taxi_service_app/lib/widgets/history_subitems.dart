import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'history_items.dart';
import '../models/ride.dart';

class HistorySubItems extends StatelessWidget {
  final DateTime time;
  final List<Ride> rides;

  ///THIS Should be replaced with provider
  const HistorySubItems({
    Key? key,
    required this.time,
    required this.rides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedRides =
        rides.where((element) => isEqual(element.time, time)).toList();
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MM/yyyy').format(time),
            style: const TextStyle(fontSize: 27),
          ),
          const SizedBox(height: 20),
          ...sortedRides
              .map(
                (ride) => HistoryItems(
                  fromLocation: ride.fromLocation,
                  toLocation: ride.toLocation,
                  rating: ride.rating,
                ),
              )
              .toList(),
        ]);
  }

  bool isEqual(DateTime time1, DateTime time2) {
    if (time1.hour == time2.hour &&
        time1.day == time2.day &&
        time1.month == time2.month)
      return true;
    else
      return false;
  }
}

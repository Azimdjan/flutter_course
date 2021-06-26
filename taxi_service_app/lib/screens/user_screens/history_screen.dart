import 'package:flutter/material.dart';
import '../../widgets/history_subitems.dart';
import '../../layouts/with_appbar.dart';
import '../../models/ride.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/history';
  List<DateTime> times = [];
  static final List<Ride> rides = [
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Amir Temur St',
      toLocation: 'Beshqayrogoch St',
      rating: 4.0,
      price: 25,
      time: DateTime.now().add(const Duration(days: 8)),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now().add(const Duration(days: 3)),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now().add(const Duration(days: 8)),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now(),
    ),
    Ride(
      fromLocation: 'Beshqayrogoch St',
      toLocation: 'Amir Temur St',
      rating: 5.0,
      price: 25,
      time: DateTime.now().add(const Duration(days: 3)),
    ),
  ];

  HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // HistoryScreen.rides.sort((a, b) => a.time.compareTo(b.time));
    // print(HistoryScreen.rides.last.time);
    extractDateTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      child: buildScreen(context),
      title: 'History',
      isWriting: false,
      margin: false,
    );
  }

  Widget buildScreen(BuildContext context) {
    return Column(
      children: widget.times
          .map((time) =>
          HistorySubItems(
            time: time,
            rides: HistoryScreen.rides,
          ))
          .toList(),
    );
  }

  void extractDateTimes() {
    HistoryScreen.rides.forEach((element) {
      if (!contain(element.time)) widget.times.add(element.time);
    });
    widget.times.sort((a, b) => a.compareTo(b));
  }

  bool contain(DateTime time) {
    var isContain = false;
    widget.times.forEach((element) {
      if (element.hour == time.hour && element.day == time.day &&
          element.month == time.month)
        isContain = true;
    });
    return isContain;
  }
}

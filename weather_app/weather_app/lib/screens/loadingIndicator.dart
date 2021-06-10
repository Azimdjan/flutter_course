import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/models/BottomText.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/api.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.green,
      baseColor: Colors.grey,
      child: Container(
        color: Colors.red,
        height: 50,
        width: double.infinity,
      )
    );
  }
}

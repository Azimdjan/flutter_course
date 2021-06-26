import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class HistoryItems extends StatelessWidget {
  final String fromLocation;
  final String toLocation;
  final double rating;

  const HistoryItems({
    Key? key,
    required this.fromLocation,
    required this.toLocation,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: mediaQuery.height * 0.13,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
              color: Color.fromRGBO(212, 212, 212, 0.4),
              spreadRadius: 3,
              blurRadius: 0.5,
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      TaxiServiceAppTheme.fromLocationIcon,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Helden St',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      TaxiServiceAppTheme.starIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '4.4',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              )
            ],
          ),
          const Divider(thickness: 1),
          Row(
            children: [
              SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(TaxiServiceAppTheme.toLocationIcon)),
              const SizedBox(width: 15),
              Text(
                'Helden St',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

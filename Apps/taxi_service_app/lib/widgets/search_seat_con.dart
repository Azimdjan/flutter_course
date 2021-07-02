import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

// ignore: must_be_immutable
class SeatContainer extends StatefulWidget {
  final PageController controller;

  const SeatContainer({Key? key, required this.controller}) : super(key: key);

  @override
  _SeatContainerState createState() => _SeatContainerState();
}

class _SeatContainerState extends State<SeatContainer> {
  var radioButtons = [true, false, false, false];
  var _isSelected = false;

  void selectButton(int index) {
    for (var i = 0; i < radioButtons.length; i++) {
      radioButtons[i] = false;
    }
    radioButtons[index] = true;
  }

  void toggleButton() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width * 1,
      height: mediaQuery.height * 0.5,
      margin: EdgeInsets.only(
        top: mediaQuery.height * 0.15,
        right: mediaQuery.width * 0.01,
        left: mediaQuery.width * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  TaxiServiceAppTheme.fromLocationIcon,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Helden St',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  color: Colors.white,
                  height: 15,
                  width: 1,
                ),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  TaxiServiceAppTheme.toLocationIcon,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Chalotte St',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(TaxiServiceAppTheme.avatar),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cihan Soysakal',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Toyota (EDF568-354)',
                      style: TextStyle(
                          color: Color.fromRGBO(113, 119, 171, 1),
                          fontSize: 17),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: const Color.fromRGBO(49, 29, 100, 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(TaxiServiceAppTheme.starIcon),
                      const SizedBox(width: 10),
                      Text(
                        '4.4',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                )
              ],
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Seat and Time',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: const Color.fromRGBO(40, 47, 98, 1),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    color: Colors.white,
                  )
                ]),
                const SizedBox(width: 15),
                Text(
                  'Select Seat',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(width: 50),
                for (var i = 0; i < radioButtons.length; i++) buildButtons(i),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: const Color.fromRGBO(40, 47, 98, 1),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    color: Colors.white,
                  )
                ]),
                const SizedBox(width: 10),
                Text(
                  'Schedule Time',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(width: 60),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Now',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Container(
                  height: 40,
                  width: 40,
                  color: const Color.fromRGBO(40, 47, 98, 1),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            FlatButton(
              onPressed: () {
                widget.controller.animateToPage(
                  widget.controller.initialPage+2,
                  duration: const Duration(seconds: 2),
                  curve: Curves.linear,
                );
              },
              minWidth: double.infinity,
              height: 50,
              color: Colors.white,
              child: Text(
                'CONTINUE',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(int index) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(right: 5),
      child: FlatButton(
        onPressed: () {
          setState(() {
            selectButton(index);
          });
        },
        color: radioButtons[index]
            ? Colors.white
            : const Color.fromRGBO(40, 47, 98, 1),
        child: Text(
          '${index + 1}',
          style: radioButtons[index]
              ? Theme.of(context).textTheme.headline2
              : Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequestContainer extends StatefulWidget {
  final PageController controller;

  const RequestContainer({Key? key, required this.controller})
      : super(key: key);

  @override
  _RequestContainerState createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  var _isSelected = false;

  void toggleButton() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      // width: mediaQuery.width * 1,
      // height: mediaQuery.height * 0.1,
      margin: EdgeInsets.only(
        top: mediaQuery.height * 0.3,
        right: mediaQuery.width * 0.01,
        left: mediaQuery.width * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: _isSelected ? const Color(0xff282F62) : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FlatButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: toggleButton,
                    child: Icon(
                      Icons.local_taxi,
                      size: 35,
                      color: !_isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: _isSelected ? Colors.white : const Color(0xff282F62),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FlatButton(
                    onPressed: toggleButton,
                    padding: const EdgeInsets.all(0),
                    child: Icon(
                      Icons.motorcycle_sharp,
                      size: 35,
                      color: _isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('34 Km', style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('1h30min',
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('\$19.99',
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )
              ],
            ),
            FlatButton(
              onPressed: () {
                widget.controller.animateToPage(widget.controller.initialPage+1,
                    duration: const Duration(seconds: 2),
                    curve: Curves.linear);
              },
              minWidth: double.infinity,
              height: 50,
              color: Colors.white,
              child: Text(
                'REQUEST FOR TAXI',
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
}

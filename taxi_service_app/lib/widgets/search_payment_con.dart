import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taxi_service_app/screens/user_screens/confirmation_screen.dart';
import 'package:taxi_service_app/theme.dart';
import 'package:taxi_service_app/widgets/card_item.dart';

// ignore: must_be_immutable
class PaymentContainer extends StatefulWidget {
  final PageController controller;

  const PaymentContainer({Key? key, required this.controller})
      : super(key: key);

  @override
  _PaymentContainerState createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
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
      width: mediaQuery.width * 1,
      height: mediaQuery.height * 0.4,
      margin: EdgeInsets.only(
        //top: mediaQuery.height * 0.15,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 275,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: const Border(
                  bottom: BorderSide(color: Color.fromRGBO(40, 47, 98, 1)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Payment',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 25),
                  const CardItem(
                    cardIcon: TaxiServiceAppTheme.cashIcon,
                    type: 'Cash Payment',
                    description: 'Default method',
                    isSelected: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CardItem(
                    cardIcon: TaxiServiceAppTheme.masterCardIcon,
                    type: 'Master Card',
                    description: '**** **** **** 8545',
                    isSelected: false,
                  )
                ],
              ),
            ),
            const Text(
              'Promo Code',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            TextField(
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.headline1,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(84, 92, 155, 1)),
                ),
                hintText: 'Enter Promo Code',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(84, 92, 155, 1),
                ),
                fillColor: Color.fromRGBO(49, 29, 100, 1.0),
                filled: true,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(ConfirmationScreen.routeName);
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

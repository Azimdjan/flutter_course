import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme.dart';
import '../../layouts/with_appbar.dart';

// ignore: must_be_immutable
class AddNewCardScreen extends StatefulWidget {
  static const routeName = '/addCard';
  List<String> months = [];
  List<String> years = [];
  int currentMonth = int.parse(DateTime.now().month.toString());
  int currentYear = int.parse(DateTime.now().year.toString());

  AddNewCardScreen({Key? key}) : super(key: key);

  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  var cardNumberController = TextEditingController();
  var cardHolderName = TextEditingController();

  @override
  void initState() {
    for (var i = 1; i <= 12; i++) widget.months.add('$i');
    for (var i = 0; i < 4; i++) widget.years.add('${widget.currentYear + i}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      child: buildScreen(context),
      title: 'Add New Card',
      isWriting: false,
      margin: false,
    );
  }

  Widget buildScreen(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: mediaQuery.height * 0.84,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: mediaQuery.height * 0.23,
            width: mediaQuery.width * 0.75,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 254, 1.0),
              border: Border.all(
                color: const Color.fromRGBO(185, 188, 221, 1),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(TaxiServiceAppTheme.qrcodeIcon),
                  const SizedBox(height: 10),
                  const Text(
                    'Scan Your Card',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(185, 188, 221, 1),
                    ),
                  )
                ],
              ),
            ),
          ),
          buildTextField(
              'Card Number', cardNumberController, TextInputType.number),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expiration Date',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          //padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(185, 188, 221, 1),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: DropdownButton<String>(
                              // menuMaxHeight: 200,
                              value: '${widget.currentMonth}',
                              items: [
                                ...widget.months.map<DropdownMenuItem<String>>(
                                  (month) {
                                    return DropdownMenuItem<String>(
                                      value: month,
                                      child: Text(
                                        month,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    );
                                  },
                                )
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  widget.currentMonth =
                                      int.parse(newValue ?? '0');
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 100,
                          //padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(185, 188, 221, 1),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: DropdownButton<String>(
                              value: '${widget.currentYear}',
                              items: [
                                ...widget.years.map<DropdownMenuItem<String>>(
                                  (year) => DropdownMenuItem(
                                    value: year,
                                    child: Text(
                                      year,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  widget.currentYear =
                                      int.parse(newValue ?? '0');
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'CVV/CVC',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 80,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(185, 188, 221, 1),
                              ),
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildTextField(
              'Card Holder Name', cardHolderName, TextInputType.text),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: FlatButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              child: Text(
                'ADD MY CARD',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(
      String title, TextEditingController controller, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: controller,
          style: Theme.of(context).textTheme.headline2,
          keyboardType: type,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(185, 188, 221, 1),
              ),
            ),
            fillColor: Color.fromRGBO(249, 250, 255, 1),
            filled: true,
          ),
        ),
      ],
    );
  }
}

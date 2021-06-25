import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'menu_screen.dart';
import '../../app_icons.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  var _isWriting = false;

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(61, 41, 115, 1.0),
          elevation: 0,
          title: const Center(
            child: Text(
              'Alaska',
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w500),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MenuScreen.routeName);
            },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(61, 41, 115, 1.0),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 250, top: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _firstController,
                        onTap: () {
                          _isWriting = true;
                        },
                        onEditingComplete: () {
                          _isWriting = false;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: const Color.fromRGBO(45, 45, 45, 0.1),
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Kichik halqa yo'li ko'chasi",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(61, 41, 115, 1.0),
                              fontSize: 17,
                              fontFamily: 'SF-Pro-Display',
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_location_sharp,
                                color: Colors.red,
                              ),
                              color: Colors.amber,
                            ),
                            suffixIcon: const Icon(
                              Icons.add,
                              color: Color.fromRGBO(61, 41, 115, 1.0),
                            )),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: _secondController,
                        onTap: () {
                          _isWriting = true;
                        },
                        onEditingComplete: () {
                          _isWriting = false;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: const Color.fromRGBO(45, 45, 45, 0.1),
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Qayerga boramiz?',
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(61, 41, 115, 1.0),
                            fontSize: 17,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on),
                            color: Colors.amber,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _secondController.clear();
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Color.fromRGBO(61, 41, 115, 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: mediaQuery.height * 0.35,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: Color.fromRGBO(61, 41, 115, 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: FlatButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.local_taxi,
                                  size: 35,
                                  color: Color.fromRGBO(61, 41, 115, 1.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xff282F62),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () {},
                                padding: const EdgeInsets.all(0),
                                child: const Icon(
                                  Icons.motorcycle_sharp,
                                  size: 35,
                                  color: Colors.white,
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
                                const Text(
                                  '34 Km',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'SF-Pro-Display',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
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
                                const Text(
                                  '1h30min',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'SF-Pro-Display',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
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
                                const Text(
                                  '\$19.99',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'SF-Pro-Display',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        FlatButton(
                          onPressed: () {},
                          minWidth: double.infinity,
                          height: 50,
                          color: Colors.white,
                          child: const Text(
                            'REQUEST FOR TAXI',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'SF-Pro-Display',
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(61, 41, 115, 1.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _isWriting
            ? null
            : FloatingActionButton(
                backgroundColor: const Color.fromRGBO(61, 41, 115, 1.0),
                onPressed: () {},
                child: const Icon(Icons.my_location),
              ),
      ),
    );
  }
}

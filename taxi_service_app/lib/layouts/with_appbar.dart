import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../screens/user_screens/menu_screen.dart';

// ignore: must_be_immutable
class LayoutWithAppBar extends StatelessWidget {
  final Widget child;
  final String title;
  Widget? downContainer;
  Widget? actionButton;
  bool isWriting;
  bool margin;

  // ignore: use_key_in_widget_constructors
  LayoutWithAppBar({
    required this.child,
    required this.title,
    this.downContainer,
    this.actionButton,
    required this.isWriting,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
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
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(253, 253, 254, 1.0),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 0, top: 20, left: 20, right: 20),
                  child: child,
                ),
              ),
              Positioned(
                bottom: 0,
                child: downContainer ?? Container(height: 1,width: 1,),
              ),
            ],
          ),
        ),
        floatingActionButton: isWriting ? null : actionButton,
      ),
    );
  }
}

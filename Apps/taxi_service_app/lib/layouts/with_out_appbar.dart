import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LayoutWithOutAppBar extends StatelessWidget {
  final Widget child;
  const LayoutWithOutAppBar({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        body: child,
      ),
    );
  }
}

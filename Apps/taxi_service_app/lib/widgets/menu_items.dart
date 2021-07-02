import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItems extends StatelessWidget {
  final String fileName;
  final String title;
  final String direction;

  const MenuItems(
      {Key? key,
      required this.fileName,
      required this.title,
      required this.direction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(direction);
      },
      child: Row(
        children: [
          SvgPicture.asset(fileName),
          const SizedBox(width: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1
          ),
        ],
      ),
    );
  }
}

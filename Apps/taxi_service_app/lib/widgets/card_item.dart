import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';

class CardItem extends StatelessWidget {
  final String cardIcon;
  final String type;
  final String description;
  final bool isSelected;

  const CardItem(
      {Key? key,
      required this.cardIcon,
      required this.type,
      required this.description,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      color: const Color.fromRGBO(49, 29, 100, 1.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(cardIcon),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 17, color: Color.fromRGBO(84, 92, 155, 1)),
              )
            ],
          ),
          const SizedBox(width: 100),
          isSelected
              ? Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(49, 29, 100, 1.0)),
                  ),
                ])
              : Container()
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatefulWidget {
  final String title;
  final bool isText;
  final String? subtitle;

  SettingItem(
      {Key? key, required this.title, required this.isText, this.subtitle})
      : super(key: key);

  @override
  _SettingItemState createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool _isValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 248, 254, 1.0),
        border: Border.all(
            color: const Color.fromRGBO(164, 158, 203, 1.0), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline2,
          ),
          widget.isText
              ? Text(
                  widget.subtitle ?? '',
                  style: const TextStyle(
                      color: Color.fromRGBO(164, 158, 203, 1.0)),
                )
              : CupertinoSwitch(
                  activeColor: Theme.of(context).primaryColor,
                  value: _isValue,
                  onChanged: (some) {
                    setState(() {
                      _isValue = some;
                    });
                  },
                ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/setting_items.dart';
import '../../layouts/with_appbar.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  SettingsScreen({Key? key}) : super(key: key);

  static final items = [
    SettingItem(
      title: 'Phone Number',
      isText: true,
      subtitle: '245-578-1568 >',
    ),
    SettingItem(
      title: 'Call',
      isText: false,
    ),
    SettingItem(
      title: 'Notification',
      isText: false,
    ),
    SettingItem(
      title: 'Favorite Address',
      isText: true,
      subtitle: 'St Quruvchi >',
    ),
    SettingItem(
      title: 'Traffic',
      isText: false,
    ),
    SettingItem(
      title: 'Language',
      isText: true,
      subtitle: 'English >',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      child: buildScreen(context),
      title: 'Settings',
      isWriting: false,
      margin: false,
      isCompleted: false,
    );
  }

  Widget buildScreen(BuildContext context) {
    return Column(
      children: items.map((item) => item).toList(),
    );
  }
}

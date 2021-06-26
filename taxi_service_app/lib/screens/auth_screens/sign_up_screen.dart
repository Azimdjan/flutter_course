import 'package:flutter/material.dart';
import '../../layouts/with_out_appbar.dart';
import '../../widgets/signup_up_con.dart';
import '../../widgets/singup_down_con.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWithOutAppBar(
      child: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: UpContainer(),
            ),
          ),
          const DownContainer(),
        ],
      ),
    );
  }
}

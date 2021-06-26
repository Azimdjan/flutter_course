import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../layouts/with_out_appbar.dart';
import '../../widgets/signin_down_con.dart';
import '../../widgets/singin_up_con.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/signIn';

  const SignInScreen({Key? key}) : super(key: key);

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

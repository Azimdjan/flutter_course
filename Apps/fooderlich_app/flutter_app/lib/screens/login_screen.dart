import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/fooderlich_pages.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const LoginScreen(),
      key: ValueKey(
        FooderlichPages.loginPath,
      ),
      name: FooderlichPages.loginPath,
    );
  }

  final String userName;


  const LoginScreen({Key key,this.userName}) : super(key: key);

  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unFocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage(
                    'assets/fooderlich_assets/rw_logo.png',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              buildTextfield(userName ?? '🍔 username'),
              const SizedBox(height: 16),
              buildTextfield('🎹 password'),
              const SizedBox(height: 16),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          Provider.of<AppStateManager>(context,listen: false).login('mockUsername','mockPassword');
        },
      ),
    );
  }

  Widget buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}

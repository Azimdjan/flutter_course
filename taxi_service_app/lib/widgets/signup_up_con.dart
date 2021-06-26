import 'package:flutter/material.dart';
import 'password_field.dart';

class UpContainer extends StatefulWidget {
  const UpContainer({Key? key}) : super(key: key);

  @override
  _UpContainerState createState() => _UpContainerState();
}

class _UpContainerState extends State<UpContainer> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Create An Account',
              style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 15,
          ),
          Text('NAME', style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            controller: null,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xff545C9B)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              fillColor: Color(0xff311d64),
              filled: true,
              hintText: 'Otajonov Azim',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xff545C9B),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'EMAIL ADDRESS',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            controller: null,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xff545C9B)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              fillColor: Color(0xff311d64),
              filled: true,
              hintText: 'example@email.com',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xff545C9B),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('ENTER NEW PASSWORD',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          const PasswordField(hint: 'new password'),
          const SizedBox(
            height: 15,
          ),
          Text('CONFIRM PASSWORD',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          const PasswordField(hint: 'confirm password'),
          const SizedBox(
            height: 25,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: mediaQuery.height * 0.08,
            child: MaterialButton(
                color: Colors.white,
                onPressed: () {},
                child: Text('SIGN UP',
                    style: Theme.of(context).textTheme.bodyText2)),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

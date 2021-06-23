import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Material(
        child: Container(
          color: const Color(0xff343B71),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Create An Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'NAME',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const TextField(
                          controller: null,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Color(0xff545C9B)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            fillColor: Color(0xff282F62),
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
                          height: 25,
                        ),
                        const Text(
                          'EMAIL ADDRESS',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const TextField(
                          controller: null,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Color(0xff545C9B)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            fillColor: Color(0xff282F62),
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
                          height: 25,
                        ),
                        const Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF-Pro-Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          obscureText: _isVisible,
                          controller: null,
                          decoration: InputDecoration(
                            hintStyle:
                                const TextStyle(color: Color(0xff545C9B)),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            fillColor: const Color(0xff282F62),
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Color(0xff545C9B),
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Color(0xff545C9B),
                                    ),
                            ),
                            hintText: 'password',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff545C9B),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          height: mediaQuery.height * 0.08,
                          child: MaterialButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: const Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff343B71),
                                  fontFamily: 'SF-Pro-Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'CREATE AN ACCOUNT?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF-Pro-Display',
                          fontSize: 14,
                          color: Color(0xff343B71),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: mediaQuery.height * 0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffB9BCDD)),
                        ),
                        child: MaterialButton(
                          elevation: 0,
                          onPressed: () {},
                          color: Colors.white,
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'SF-Pro-Display',
                                fontWeight: FontWeight.w500,
                                color: Color(0xff343B71)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

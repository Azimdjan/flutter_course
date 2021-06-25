import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  const PasswordField({Key? key,required this.hint}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isVisible,
      controller: null,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Color(0xff545C9B)),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        hintText: widget.hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xff545C9B),
          ),
        ),
      ),
    );
  }
}

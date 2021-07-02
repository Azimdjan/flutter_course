import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/form_validation.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  final VoidCallback function;
  final FocusScopeNode node;
  TextEditingController? passwordController;
  TextEditingController? confirmController;
  var isValid = true;

  PasswordField({
    Key? key,
    required this.hint,
    this.passwordController,
    this.confirmController,
    required this.node,
    required this.isValid,
    required this.function,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isVisible,
      textInputAction: widget.confirmController == null
          ? TextInputAction.done
          : TextInputAction.next,
      style: const TextStyle(color: Colors.white),
      controller: widget.passwordController ?? widget.confirmController,
      onEditingComplete: () {
        widget.function();
        widget.confirmController == null
            ? widget.node.nextFocus()
            : widget.node.unfocus();
      },
      decoration: InputDecoration(
        errorText: widget.confirmController == null
            ? widget.isValid
                ? null
                : Validation.passwordErrorText(widget.passwordController)
            : widget.isValid
                ? null
                : 'Not the same with password',
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        hintStyle: const TextStyle(color: Color(0xff545C9B)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        fillColor: const Color(0xff311d64),
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

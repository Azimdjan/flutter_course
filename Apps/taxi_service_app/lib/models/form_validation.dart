import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

enum NameInputError { empty, notProper, startNumber }
enum PasswordInputError { empty, notEnough, notSpecial }
enum EmailInputError { empty, notEmail, startNumber }

class NameInput extends FormzInput<String, NameInputError> {
  const NameInput.pure() : super.pure('');

  const NameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  NameInputError? validator(String value) {
    if (value.isNotEmpty == true) {
      if (RegExp('^\\d').hasMatch(value)) {
        return NameInputError.startNumber;
      }
      if (RegExp('[\$,#,^,(,),%,!,?<,>,&,*,@,~,+]').hasMatch(value))
        return NameInputError.notProper;
      return null;
    } else {
      return NameInputError.empty;
    }
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    if (value.isNotEmpty == true) {
      if(value.length < 4)
        return PasswordInputError.notEnough;
      if(!RegExp('[\$,#,^,(,),%,!,?<,>,&,*,]').hasMatch(value))
        return PasswordInputError.notSpecial;
      return null;
    } else
      return PasswordInputError.empty;
  }
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    if (value.isNotEmpty == true) {
      if (RegExp('^\\d').hasMatch(value)) {
        return EmailInputError.startNumber;
      }
      if (!RegExp('[@]').hasMatch(value)) return EmailInputError.notEmail;
      return null;
    } else {
      return EmailInputError.empty;
    }
  }
}

class Validation {
  static bool confirmValidation(
      TextEditingController controller1, TextEditingController controller2) {
    return controller1.text == controller2.text;
  }

  static bool nameValidation(TextEditingController controller) {
    print(NameInput.dirty(value: controller.text).validator(controller.text));
    return NameInput.dirty(value: controller.text).valid;
  }

  static String? nameErrorText(TextEditingController controller) {
    final input =
        NameInput.dirty(value: controller.text).validator(controller.text);
    if (input == NameInputError.startNumber)
      return 'Name must not start with number';
    if (input == NameInputError.empty) return 'Name field must not be empty';
    if (input == NameInputError.notProper)
      return 'Name field must not contain special characters';
  }

  static bool emailValidation(TextEditingController controller) {
    return EmailInput.dirty(value: controller.text).valid;
  }

  static String? emailErrorText(TextEditingController controller) {
    final input =
        EmailInput.dirty(value: controller.text).validator(controller.text);
    if (input == EmailInputError.notEmail) return 'It is not email';
    if (input == EmailInputError.empty) return 'Email field must not be empty';
  }

  static bool passwordValidation(TextEditingController controller) {
    return PasswordInput.dirty(value: controller.text).valid;
  }

  static String? passwordErrorText(TextEditingController? controller) {
    final input =
        PasswordInput.dirty(value: controller!.text).validator(controller.text);
    if (input == PasswordInputError.notSpecial)
      return 'Password field must contain special character';
    if (input == PasswordInputError.notEnough)
      return 'Must be more than 4 characters';
    if (input == PasswordInputError.empty)
      return 'Password field must not be empty';
  }
}

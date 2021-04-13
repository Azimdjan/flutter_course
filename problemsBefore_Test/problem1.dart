import 'dart:io';

void main() {
  print("Please enter number of test cases: ");
  int number = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < number; i++) {
    String text = stdin.readLineSync()!;
    String checked = text.check;
    print(checked);
  }
}

extension on String {
  String get check {
    RegExp regExp = RegExp("\(aueio)");
    if (regExp.hasMatch(this))
      return "good string";
    else
      return "ugly string";
  }
}

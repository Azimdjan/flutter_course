import 'dart:io';

void main() {
  message();
  print("End of main");
}

void message() async {
  try {
    String message = await Future<String>.delayed(
        Duration(seconds: 4), () => "I am from future.");
    print(message);
  } on FileSystemException catch (message) {
    print(message);
  } finally {
    print("End of message");
  }
}

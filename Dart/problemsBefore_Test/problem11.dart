import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  workingWithFile();
}

void workingWithFile() async {
  final url = 'file.txt';
  final file = File(url);
  String message = '';
  try {
    final reading = file.openRead();
    await for (var stream in reading.transform(utf8.decoder)) {
      message = stream;
      replaceFile(message);
    }
  } on FileSystemException catch (error) {
    print(error);
  } finally {
    print("Reading is done.");
  }
}

void replaceFile(String message) {
  String replace = message.replaceRange(0, 5, "replacement");
  print(replace);
}

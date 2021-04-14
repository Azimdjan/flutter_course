import 'dart:convert';
import 'dart:io';

void main() async {
  Write();
  Read();
  // for (int i = 0; i < 7; i++) {
  //   int number = int.parse(stdin.readLineSync()!);
  //   numbers.add(number);
  // }
  // print("Please enter price: ");
  // int sum = int.parse(stdin.readLineSync()!);
  // int sum_List = numbers.reduce((value, element) => value + element);
  // if (sum > sum_List)
  //   print(sum - sum_List);
  // else
  //   print(0);
}

void Write() async {
  final filename = 'file.txt';
  print("Please enter coins and sum: ");
  String coins = stdin.readLineSync()!;
  var file = await File(filename).writeAsString(coins);
  // print("Please enter sum: ");
  // String sum = stdin.readLineSync()!;
  // file = await File(filename).writeAsString(sum);
}

void Read() async {
  final file = File('Myfile.txt');
  List<String> string_lines = [];
  List<int> coins = [];
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      string_lines = line.split(" ");
      string_lines.forEach((element) => coins.add(int.parse(element)));
    }
  } catch (e) {
    print('Error: $e');
  }
  int total = 0;
  for (int i = 0; i <= coins.length - 2; i++) total += coins[i];
  int sum = coins[coins.length - 1];
  (total < sum) ? print(sum - total) : print(0);
}

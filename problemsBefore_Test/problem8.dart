void main(List<String> args) {
  print("Before future is calling.");

  final number = Future<int>.delayed(Duration(seconds: 5), () => 42);
  number
      .then((value) => print("Value: $value"))
      .catchError(print)
      .whenComplete(() => print("Future is completed."));
  print("After future.");
}

// Future<void> main() async {
//   print("Before future is calling.");
//   try {
//     final number = await Future<int>.delayed(Duration(seconds: 5), () => 42);
//     print("Value: $number");
//   } catch (Exception) {
//     print(Exception);
//   } finally {
//     print("Future is done.");
//   }
//   print("After future.");
// }

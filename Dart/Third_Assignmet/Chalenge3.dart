void main() {
  final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  scores.sort();
  print("first: ${scores.first}");
  print("last: ${scores.last}");
  final b_scores = scores.where((element) => element >= 80 && element <= 90);
  print(b_scores.toList());
}

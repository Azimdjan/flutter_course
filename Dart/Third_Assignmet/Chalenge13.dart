void main() {
  final some = 3.minutes;
  print(some);
}

extension on int {
  int get minutes => this*Duration.minutesPerHour;
}

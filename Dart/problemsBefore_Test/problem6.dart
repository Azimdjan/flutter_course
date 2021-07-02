import 'dart:io';

void main() {
  stdout.write("Please enter number: ");
  int number = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= number; i++) (isPerfect(number)) ? print(i) : '';
}

bool isPerfect(int number) {
  int sum = 0;
  for (int i = 1; i <= number / 2; i++) {
    if (number % i == 0) sum += i;
  }
  return (sum == number) ? true : false;
}

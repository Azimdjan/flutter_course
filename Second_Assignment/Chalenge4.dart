void main() => calculate();

void calculate() {
  const number = 53;
  bool isPrime = true;
  if (number <= 1) {
    print("Please enter normal number!");
  } else {
    for (int i = 1; i < number / 2; i++) {
      if (number % i == 0) isPrime = false;
    }
  }
  (isPrime) ? print("Prime") : print("Not Prime");
}

void main() {
  const number = 15;
  int current = 0;
  int next = 1;
  int fib = 1;
  print("$fib ");
  for (int i = 0; i < number - 1; i++) {
    fib = current + next;
    print("$fib ");
    current = next;
    next = fib;
  }
}

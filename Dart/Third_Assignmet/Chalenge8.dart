void main() {
  Calculator calculator = Calculator();
  calculator.sum(10, 19);
}

class Calculator with Adder {}

mixin Adder {
  void sum(int a, int b) => print(a + b);
}

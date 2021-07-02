void main() {
  final result = repeatTask(4, 2, task);
  print(result);
}

Function task = (int input) => input *= input;

int repeatTask(int times, int input, Function task) {
  int result = task(input);
  for (int i = 0; i < times-1; i++) {
    result = task(result);
  }
  return result;
}

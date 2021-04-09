void main() {
  Function task = (int input) {
    input *= input;
  };
  final result = repeatTask(4, 2, task);
  print(result);
}

int repeatTask(int times, int input, Function task) {
  int result = task(input);
  for (int i = 0; i < times; i++) {
    result = task(result);
  }
  return result;
}

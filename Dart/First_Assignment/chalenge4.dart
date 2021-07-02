void main() {
  const number = 34;
  int i = 1;
  while (true) {
    if (i >= number) {
      break;
    }
    i *= 2;
  }
  print("Next number is $i.");
}

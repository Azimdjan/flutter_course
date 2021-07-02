

void main() {
  int result = function(0) ?? 0;
  result = function(1) as int;
  print(result);
}

int? function(int i) => (i == 1) ? 42 : null;

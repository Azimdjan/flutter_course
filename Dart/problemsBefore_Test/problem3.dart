import 'dart:io';

void main() {
  List<Complex> complexNums = [];
  stdout.write("Please enter number of complex number: ");
  int number = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < number; i++) {
    print("Please enter complex number: ");
    stdout.write("Enter real part: ");
    int realPart = int.parse(stdin.readLineSync()!);
    stdout.write("Enter imaginary part: ");
    int imaginaryPart = int.parse(stdin.readLineSync()!);
    complexNums.add(Complex(realPart, imaginaryPart));
  }
  stdout.write("Unsorted: ");
  print(complexNums);
  complexNums.sort((e1, e2) => e1._realPart.compareTo(e2._realPart));
  stdout.write("Sorted by real part: ");
  print(complexNums);
  final filtered = complexNums.where((element) => element._realPart >= 20);
  stdout.write("Filtered: ");
  print(filtered.toList());
  Complex sum_RealPart =
      complexNums.reduce((value, element) => Complex.sum(value, element));
  stdout.write("Sum: ");
  print(sum_RealPart);
}

class Complex {
  int _realPart;
  int _imaginary_Part;
  int get realPart => _realPart;
  int get imaginary_Part => _imaginary_Part;
  set setRealPart(int realPart) => _realPart = realPart;
  set setImaginaryPart(int imaginaryPart) => _imaginary_Part = imaginaryPart;
  Complex(this._realPart, this._imaginary_Part);

  static Complex sum(Complex num1, Complex num2) => Complex(
      num1._realPart + num2._realPart,
      num1._imaginary_Part + num2._imaginary_Part);

  static Complex substract(Complex num1, Complex num2) => Complex(
      num1._realPart - num2._realPart,
      num1._imaginary_Part - num2._imaginary_Part);

  @override
  String toString() => "$_realPart+${_imaginary_Part}i";
}

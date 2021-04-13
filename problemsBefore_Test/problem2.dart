void main() {
  Rectangle rectangle = Rectangle(14, 32);
  print(rectangle);
}

class Rectangle {
  double _lenght;
  double _width;
  double get lenght => _lenght;
  double get width => _width;
  set setLenght(double lenght) => _lenght = lenght;
  set setWidth(double width) => _width = width;

  Rectangle(this._lenght, this._width) : assert(_lenght > 0 && _width > 0);
  double getParametr() => 2 * (_lenght + _width);
  double getArea() => _lenght * _width;

  String toString() =>
      "Lenght: $_lenght\n Width: $_width\n" +
      "Area: ${this.getArea()}\n Perimeter: ${this.getParametr()}\n";
}

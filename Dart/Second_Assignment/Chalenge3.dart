import 'dart:math';

void main() {
  Sphere sphere = Sphere();
  print("Volume of Sphere: ${sphere.volume()}");
  print("Surface area of Sphere ${sphere.surfaceArea()}");
}

class Sphere {
  const Sphere({int radius = 12})
      : assert(radius >= 0),
        _radius = radius;
  final int _radius;
  static double pi = 3.14;

  double volume() {
    return 4 / 3 * pi * pow(_radius, 3);
  }

  double surfaceArea() {
    return 4 * pi * pow(_radius, 2);
  }
}

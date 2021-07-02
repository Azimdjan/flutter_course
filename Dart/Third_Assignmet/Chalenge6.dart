void main(List<String> args) {
  List<Fruit> fruits = [
    Fruit("Red"),
    WaterMelon("Green"),
    Cantalope("Grey"),
  ];

  fruits.forEach((element) => print(element.describeColor()));
}

class Fruit {
  String _color;
  String get color => _color;
  set color(String color) => _color = color;
  Fruit(this._color);

  String describeColor() => "Fruit is $_color color.";
}

class Melon extends Fruit {
  Melon(String color) : super(color);
}

class WaterMelon extends Melon {
  WaterMelon(String color) : super(color);

  @override
  String describeColor() => "Watermelon is $_color color.";
}

class Cantalope extends Melon {
  Cantalope(String color) : super(color);

  @override
  String describeColor() => "Cantalope is $_color color.";
}

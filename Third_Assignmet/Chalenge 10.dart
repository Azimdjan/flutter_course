void main() {
  List<Platypus> platypus = [
    Platypus("first", 50),
    Platypus("second", 40),
    Platypus("third", 45)
  ];
  platypus.sort((p1, p2) => p1._weight.compareTo(p2._weight));
  print(platypus);
}

class Platypus implements Comparable {
  String _name;
  int _weight;
  int get weight => _weight;
  String get name => _name;
  Platypus(this._name, this._weight);

  @override
  int compareTo(other) {
    if (this._weight == other.weight)
      return 0;
    else if (this._weight > other.weight)
      return 1;
    else
      return -1;
  }

  @override
  String toString() => "Name: $name Weight: $_weight\n";
}

void main() {
  Name human1 = Name("Azim", "Otajonov", true);
  Name human2 = Name("Mirorif", "Mirzokirov", false);
  Name human3 = Name.withoutSurname("Ronaldinho");

  print(human1);
  print(human2);
  print(human3);
}

class Name {
  String _givenName;
  String get givenName => _givenName;
  set givenName(String givenName) => _givenName = givenName;
  String? _surname;
  String? get surname => _surname;
  set surname(String? surname) => _surname = surname;
  bool? _surNameIsFirst;
  bool? get surNameIsFirst => _surNameIsFirst;
  set surNameIsFirst(bool? surNameIsFirst) => _surNameIsFirst = surNameIsFirst;

  Name(this._givenName, this._surname, this._surNameIsFirst);
  Name.withoutSurname(this._givenName);

  String toString() {
    if (_surname == null)
      return "Dear $_givenName";
    else if (_surNameIsFirst == true)
      return "Dear $_surname $_givenName";
    else
      return "Dear $_givenName $_surname";
  }
}

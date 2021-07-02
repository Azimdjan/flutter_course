void main() {
  Note_taking.print_Notes();
}

class Note_taking {
  static void print_Notes() {
    SQL_Database().some_Data();
  }
}

abstract class SQL_Database {
  void some_Data();
  factory SQL_Database() => Fake_Database();
}

class Fake_Database implements SQL_Database {
  @override
  void some_Data() => print("These data sent from sql database.");
}

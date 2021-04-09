void main() {
  var bert = Student("Bert", "Johnson", 85);
  var ernie = Student("Ernie", "Johnson", 95);
  print(bert);
  print(ernie);
}

class Student {
  Student(this.firstName, this.lastName, this.grade);

  final String firstName;
  final String lastName;
  int grade;

  String toString() {
    return "First name: $firstName \nLast name: $lastName \nGrade: $grade";
  }
}

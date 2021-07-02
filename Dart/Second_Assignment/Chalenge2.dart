void main() {
  var bert = Student("Bert", "Johnson", 85);
  var ernie = Student("Ernie", "Johnson", 95);
  print(bert.toJson());
  print(ernie.toJson());
}

class Student {
  Student(this.firstName, this.lastName, this.grade);

  final String firstName;
  final String lastName;
  int grade;

  String toJson() {
    return '{"firstName"="$firstName" "lastName"="$lastName" "grade"=$grade}';
  }
}

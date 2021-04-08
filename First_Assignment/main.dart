import 'dart:math';

void main() {
  const attendance = 20;
  const homework = 30;
  const exam = 50;
  int attenPoint = 90;
  int homePoint = 80;
  int examPoint = 94;
  int grade;
  grade = (attenPoint * (attendance / 100) +
      homePoint * (homework / 100) +
      examPoint * (exam / 100)).toInt();
  print("Student's grade is $grade%");
}

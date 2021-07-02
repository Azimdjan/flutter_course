void main() {
  final someText = "Hello World! My name is Otajonov Azim and I am a student at Inha University.";
  final splitted = string_List(someText);
  print(splitted);
  print(frequency(splitted));
}

List<String> string_List(String text) => text.split(' ');
List<int> frequency(List<String> temp) {
  List<int> count = [];
  temp.forEach((element) => count.add(element.length));
  return count;
}

void main() {
  Map<String, String> newMap = {
    "Name": "Azim",
    "Profession": "Student",
    "Country": "Uzbekistan",
    "City": "Tashkent"
  };

  newMap["Country"] = "Canada";
  newMap["City"] = "Toronto";

  //newMap.forEach((key, value) => print("$key -> $value"));
  var some = isValid(1);
  var someother = isValid(2);
  print(some);
  print(someother);
}

isValid(int i) {
  if (i == 1)
    return true;
  else
    return 'Try again';
}

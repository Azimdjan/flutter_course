void main() {
  Map<String, String> newMap = {
    "Name": "Azim",
    "Profession": "Student",
    "Country": "Uzbekistan",
    "City": "Tashkent"
  };

  newMap["Country"] = "Canada";
  newMap["City"] = "Toronto";

  newMap.forEach((key, value) => print("$key -> $value"));
}

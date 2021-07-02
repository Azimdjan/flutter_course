void main() {
  final user1 = User("u1910293", "Azim");
  final user2 = User("u1910276", "Karim");
  final user3 = User("u1910289", "Nodir");
  List<User> users = [];
  users.addAll([user1, user2, user3]);

  List<Map> listOfMaps = [];
  users.forEach((element) => listOfMaps.add(getMap(element)));
  print(listOfMaps);
}

class User {
  final _id;
  final _name;
  User(String id, String name)
      : assert(!id.isEmpty),
        assert(!name.isEmpty),
        _id = id,
        _name = name;
}

Map<String, String> getMap(User user) {
  Map<String, String> temp = {"ID": user._id, "Name": user._name};
  return temp;
}

void main() {
  User user1 = User(1910293, "Azim");
  User user2 = User(2029309, "Mirorif");
  User user3 = User(1910283, "Nodir");
  List<User> users = [user1, user2, user3];
  List<Map> map_users = [];
  users.forEach((element) => map_users.add(userToMap(element)));
  print(map_users);
}

class User {
  int id;
  String name;
  User(this.id, this.name);

  String toString() => "$id $name";
}

Map<String, Object> userToMap(User user) {
  Map<String, Object> temp = {"Id": user.id, "Name": user.name};
  return temp;
}

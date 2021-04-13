void main() {
  final map = {"id": 10, "name": "Manda"};
  final manda = User.fromJson(map);
  print(manda);
}

class User {
  final id;
  final name;
  User(this.id, this.name);
  static User fromJson(Map<String, Object> json) {
    final userID = json['id'];
    final userName = json['name'];
    return User(userID, userName);
  }

  String toString() => "$id $name";
}

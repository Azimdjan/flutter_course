// import 'dart:convert';
// import 'dart:io';
// //import "package:http/http.dart" as http;

// void main() {}

// Future<void> request() async {
//   final url = 'http://jsonplaceholder.typicode.com/todos/1';
//   //final responce = await http.get(url);
//   //final statusCode = responce.statusCode;
//   //if (statusCode == 200) {
//     //final rawJsonBody = responce.body;
//     final jsonMap = jsonDecode(rawJsonBody);
//     final todo = TODO.fromJson(jsonMap);
//     print(todo);
//   }
// }

// class TODO {
//   TODO({int userId = 0, int id = 0, String title = '', bool completed = true})
//       : _userId = userId,
//         _id = id,
//         _title = title,
//         _completed = completed;
//   final int _userId;
//   final int _id;
//   final String _title;
//   final bool _completed;

//   factory TODO.fromJson(Map<String, Object> jsonMap) {
//     return TODO(
//       userId: jsonMap['userId'] as int,
//       id: jsonMap['id'] as int,
//       title: jsonMap['title'] as String,
//       completed: jsonMap['completed'] as bool,
//     );
//   }

//   @override
//   String toString() => "UserID: $_userId\n"
//       "ID: $_id\n Title: $_title\n Completed: $_completed\n";
// }

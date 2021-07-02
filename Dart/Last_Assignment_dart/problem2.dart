import 'dart:convert';
import 'dart:io';

void main() async {
  final url = "https://jsonplaceholder.typicode.com/comments";
  final request = await HttpClient().getUrl(Uri.parse(url));
  final responce = await request.close();
  final jsonStream = await responce.transform(Utf8Decoder());
  StringBuffer stringBuffer = StringBuffer();
  await for (var data in jsonStream) {
    stringBuffer.write(data);
  }
  final jsonString = stringBuffer.toString();
  List<String> splittedJson = jsonString.split("},");
  print(splittedJson[0]);
}

class Comment {
  final int _postId;
  final int _id;
  final String _name;
  final String _email;
  final String _body;
  Comment(int postId, int id, String name, String email, String body)
      : _postId = postId,
        _id = id,
        _name = name,
        _email = email,
        _body = body;

  factory Comment.fromJson(Map<String, Object> map) {
    final postId = map['postId'] as int;
    final id = map['id'] as int;
    final name = map['name'] as String;
    final email = map['email'] as String;
    final body = map['body'] as String;
    return Comment(postId, id, name, email, body);
  }

  @override
  String toString() => "PostId: $_postId\n"
      "Id: $_id\nName: $_name\nEmail: $_email\nBody: $_body\n";
}

void main() {
  final String message = "Hello there! My name is Otajonov Azim.";
  final String encoded_message = message.encoded;
  final String decoded_message = encoded_message.decoded;
  print("Encoded message: '$encoded_message'");
  print("Decoded message: '$decoded_message'");
}

extension on String {
  String get encoded => _coded(2);
  String get decoded => _coded(-2);

  String _coded(int type) {
    final text = StringBuffer();
    for (var element in runes) {
      text.writeCharCode(element + type);
    }
    return text.toString();
  }
}

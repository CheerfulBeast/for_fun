class TextSlicing {
  String slice(String str) {
    return str.toString().split('.').last;
  }
}

TextSlicing textSlicing = TextSlicing();

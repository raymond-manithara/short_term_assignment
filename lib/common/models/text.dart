class Text {
  final String text;
  final bool isBold;
  Text({this.isBold = false, this.text = ''});
  Text.fromJson(Map jsonData)
      : text = jsonData["text"] ?? '',
        isBold = jsonData["bold"] == "true" ? true : false;
}

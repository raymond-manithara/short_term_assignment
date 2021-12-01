import 'package:short_term_assignment/common/models/text.dart';

class StoryPage {
  final List<Text> texts;
  final String topImageUrl;
  final String bottomImageUrl;
  final String backgroundColor;
  final String textColor;
  StoryPage(
      {this.backgroundColor = '',
      this.bottomImageUrl = '',
      this.textColor = '',
      this.texts = const [],
      this.topImageUrl = ''});
  StoryPage.fromJson(Map jsonData)
      : texts = jsonData["texts"]
                ?.map<Text>((jsonEntry) => Text.fromJson(jsonEntry))
                ?.toList() ??
            [],
        topImageUrl = jsonData["topImageUrl"] ?? '',
        bottomImageUrl = jsonData["bottomImageUrl"] ?? '',
        backgroundColor = jsonData["backgroundColor"] ?? '',
        textColor = jsonData["textColor"] ?? '';
}

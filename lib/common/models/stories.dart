import 'package:short_term_assignment/common/models/page.dart';

class Story {
  final dynamic id;
  final String name;
  final String iconUrl;
  final String cornerImageUrl;
  final String borderColor;
  final List<StoryPage> pages;
  Story(
      {this.borderColor = '',
      this.cornerImageUrl = '',
      this.iconUrl = '',
      this.id = 0,
      this.name = '',
      this.pages = const []});
  Story.fromJson(Map jsonData)
      : id = jsonData["id"] ?? 0,
        name = jsonData["name"] ?? '',
        iconUrl = jsonData["iconUrl"] ?? '',
        cornerImageUrl = jsonData["cornerImageUrl"] ?? '',
        borderColor = jsonData["borderColor"] ?? '',
        pages = jsonData["pages"]
                ?.map<StoryPage>((jsonEntry) => StoryPage.fromJson(jsonEntry))
                ?.toList() ??
            [];
}

import 'dart:convert';

import 'package:short_term_assignment/common/models/stories.dart';
import 'package:short_term_assignment/modules/home/service/home_repository.dart';
import 'package:short_term_assignment/utils/http/http_repository.dart';
import 'package:short_term_assignment/utils/injection/registery.dart';
import 'package:short_term_assignment/utils/url/url_repository.dart';

class HomeService extends HomeRepository {
  /// Repositories
  late HttpRepository _httpRepository;
  late UrlRepository _urlRepository;
  HomeService() {
    /// Reading objects from DI registery
    _httpRepository = container.get<HttpRepository>();
    _urlRepository = container.get<UrlRepository>();
  }

  /// Method to fetch data from API
  @override
  Future<List<Story>> getStoriesFromAPI() async {
    String encodedUri = _urlRepository.constructEncodedUri();
    var jsonData = await _httpRepository.getRequest(encodedUri);
    jsonData = jsonDecode(jsonData);
    return jsonData["home"]["stories"]
        .map<Story>((jsonEntry) => Story.fromJson(jsonEntry))
        .toList();
  }
}

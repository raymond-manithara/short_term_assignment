import 'package:short_term_assignment/common/models/stories.dart';

abstract class HomeRepository {
  Future<List<Story>> getStoriesFromAPI();
}

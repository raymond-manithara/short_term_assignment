import 'package:flutter/foundation.dart';
import 'package:short_term_assignment/common/models/stories.dart';
import 'package:short_term_assignment/modules/home/service/home_repository.dart';
import 'package:short_term_assignment/utils/injection/registery.dart';

class HomeProvider with ChangeNotifier {
  /// Repositories
  late HomeRepository _repository;

  /// Constructor arguments

  HomeProvider() {
    _repository = container.get<HomeRepository>();
  }

  /// State variables
  List<Story> stories = [];
  bool isLoading = true;

  /// Methods
  downloadStoriesFromAPI() async {
    setLoading(true);
    print('----------- API Download Request ---------------');
    stories = await _repository.getStoriesFromAPI();
    stories.forEach((Story element) {
      print(element.name);
    });
    setLoading(false);
  }

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }
}

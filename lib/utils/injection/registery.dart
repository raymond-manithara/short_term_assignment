import 'package:get_it/get_it.dart';
import 'package:short_term_assignment/modules/home/service/home_repository.dart';
import 'package:short_term_assignment/modules/home/service/home_service.dart';
import 'package:short_term_assignment/utils/http/http_repository.dart';
import 'package:short_term_assignment/utils/http/http_service.dart';
import 'package:short_term_assignment/utils/url/url_repository.dart';
import 'package:short_term_assignment/utils/url/url_service.dart';

GetIt container = GetIt.instance;

void inject() {
  /// Lazy Singleton registrations for Utility Services
  container.registerLazySingleton<UrlRepository>(() => UrlService());
  container.registerLazySingleton<HttpRepository>(() => HttpService());

  /// Lazy Singleton registrations for Module Services
  container.registerLazySingleton<HomeRepository>(() => HomeService());
}

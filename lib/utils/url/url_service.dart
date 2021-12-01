import 'package:short_term_assignment/common/config/config.dart';
import 'package:short_term_assignment/utils/url/url_repository.dart';

class UrlService extends UrlRepository {
  late Config _config;
  UrlService() {
    _config = Config();
  }
  @override
  String constructEncodedUri() {
    String uri =
        '${_config.baseUri}?page=${_config.page}&type=${_config.type}&appname=${_config.appName}&lang=${_config.language}';

    return uri;
  }

  @override
  String encodeUri(String uri) {
    String encodedUri = Uri.encodeComponent(uri);
    return encodedUri;
  }
}

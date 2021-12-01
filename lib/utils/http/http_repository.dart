abstract class HttpRepository {
  /// [Get] request function
  Future<dynamic> getRequest(String url, {bool isTokenEnabled = false});
}

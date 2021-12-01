import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:short_term_assignment/utils/http/http_repository.dart';

class HttpService extends HttpRepository {
  late Dio _httpHandler;

  HttpService() {
    /// Objects
    _httpHandler = Dio();
  }
  @override
  Future<dynamic> getRequest(String url, {bool isTokenEnabled = false}) async {
    try {
      Response response = await _httpHandler.get(url);
      return response.data;
    } catch (e) {
      if (e is DioError) {
        DioError _error = e;
        String message = _error.message;
        String statusCode = _error.response?.statusCode?.toString() ?? '';
        print(message);
        Fluttertoast.showToast(
          msg: '[$statusCode] : $message',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return null;
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:short_term_assignment/modules/home/home.dart';
import 'package:short_term_assignment/modules/error/error.dart';
import 'package:short_term_assignment/modules/stories/stories.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    dynamic arguments = settings.arguments;
    String route = settings.name ?? '';
    switch (route) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/stories':
        return MaterialPageRoute(
            builder: (context) => Stories(story: arguments));

      default:
        return MaterialPageRoute(builder: (context) => Error());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:short_term_assignment/utils/injection/registery.dart'
    as container;
import 'package:short_term_assignment/utils/routing/generator.dart';

void main() {
  container.inject();
  runApp(ShortTermAssignment());
}

class ShortTermAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short Term Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}

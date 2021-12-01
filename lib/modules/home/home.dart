import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_term_assignment/modules/home/home_provider.dart';
import 'package:short_term_assignment/modules/home/ui/home_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomeUI(),
    );
  }
}

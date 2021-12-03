import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColoredSafeArea extends StatefulWidget {
  final Widget child;
  final Color? color;

  const ColoredSafeArea({Key? key, required this.child, this.color})
      : super(key: key);

  @override
  _ColoredSafeAreaState createState() => _ColoredSafeAreaState();
}

class _ColoredSafeAreaState extends State<ColoredSafeArea> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black54,
        statusBarIconBrightness: Brightness.light));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Theme.of(context).colorScheme.primaryVariant,
      child: widget.child,
    );
  }
}

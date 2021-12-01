import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_term_assignment/common/models/stories.dart';
import 'package:short_term_assignment/modules/stories/stories_provider.dart';
import 'package:short_term_assignment/modules/stories/ui/stories_ui.dart';

class Stories extends StatefulWidget {
  final Story? story;
  const Stories({Key? key, this.story}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoriesProvider(widget.story),
      child: StoriesUI(),
    );
  }
}

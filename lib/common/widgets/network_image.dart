import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryNetworkImage extends StatelessWidget {
  final String imageUri;
  final BoxFit fit;

  const StoryNetworkImage({
    Key? key,
    required this.imageUri,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUri,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(child: CupertinoActivityIndicator());
      },
    );
  }
}

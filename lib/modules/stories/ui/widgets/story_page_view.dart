import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:short_term_assignment/common/models/page.dart';
import 'package:short_term_assignment/common/theme/color.dart';

class StoryPageView extends StatelessWidget {
  final StoryPage storyPage;

  const StoryPageView({
    Key? key,
    required this.storyPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: HexColor(storyPage.backgroundColor),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 28),
            child: CachedNetworkImage(
              imageUrl: storyPage.topImageUrl,
              placeholder: (context, url) => new CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CachedNetworkImage(
            imageUrl: storyPage.bottomImageUrl,
            placeholder: (context, url) => new CupertinoActivityIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: storyPage.texts
                    .map<Widget>((_text) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            _text.text,
                            style: TextStyle(
                                fontWeight: _text.isBold
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ))
                    .toList()),
          ),
        ),
      ],
    );
  }
}

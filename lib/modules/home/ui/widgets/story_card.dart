import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:short_term_assignment/common/models/stories.dart';
import 'package:short_term_assignment/common/theme/color.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/stories', arguments: story);
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor(story.borderColor), width: 1.3)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CachedNetworkImage(
                imageUrl: story.cornerImageUrl,
                placeholder: (context, url) => new CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            Center(
              child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CachedNetworkImage(
                    imageUrl: story.iconUrl,
                    placeholder: (context, url) =>
                        new CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  story.name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

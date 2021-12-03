import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        width: 150,
        margin: EdgeInsets.only(right: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor(story.borderColor), width: 1.3)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.network(story.cornerImageUrl),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        story.iconUrl,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(story.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.black87))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

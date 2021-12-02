import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:short_term_assignment/common/theme/color.dart';
import 'package:short_term_assignment/modules/home/home_provider.dart';
import 'package:short_term_assignment/modules/home/ui/widgets/story_card.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  void initState() {
    Future.microtask(() async {
      await context.read<HomeProvider>().downloadStoriesFromAPI();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: HexColor('#f1f1f1'),
        child: context.select((HomeProvider provider) => provider.isLoading)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 200),
                      child: Text('Craft Stories',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                    CupertinoActivityIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Loading Stories, Please wait...',
                        style: GoogleFonts.roboto())
                  ])
            : Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, bottom: 20, left: 30),
                    child: Text('Stories',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: context
                            .select((HomeProvider provider) => provider.stories)
                            .length,
                        itemBuilder: (context, index) {
                          return Builder(builder: (context) {
                            return StoryCard(
                              story: context.select((HomeProvider provider) =>
                                  provider.stories)[index],
                            );
                          });
                        }),
                  ),
                ],
              )),
      ),
    );
  }
}

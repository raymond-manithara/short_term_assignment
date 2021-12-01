import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Material(
      color: HexColor('#f1f1f1'),
      child: context.select((HomeProvider provider) => provider.isLoading)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  CupertinoActivityIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading content please wait...')
                ])
          : Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20, left: 30),
                  child: Text(
                    'Stories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: context
                          .select((HomeProvider provider) => provider.stories)
                          .length,
                      itemBuilder: (context, index) {
                        return Builder(builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: StoryCard(
                              story: context.select((HomeProvider provider) =>
                                  provider.stories)[index],
                            ),
                          );
                        });
                      }),
                ),
              ],
            )),
    );
  }
}

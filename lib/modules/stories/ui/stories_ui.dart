import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_term_assignment/common/models/page.dart';
import 'package:short_term_assignment/modules/stories/stories_provider.dart';
import 'package:short_term_assignment/modules/stories/ui/widgets/animated_bar.dart';
import 'package:short_term_assignment/modules/stories/ui/widgets/story_page_view.dart';

class StoriesUI extends StatefulWidget {
  const StoriesUI({Key? key}) : super(key: key);

  @override
  _StoriesUIState createState() => _StoriesUIState();
}

class _StoriesUIState extends State<StoriesUI> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<StoriesProvider>().initializeAnimation(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<StoriesProvider>().setContext(context);
    return SafeArea(
      child: Material(
          child: GestureDetector(
        onLongPress: () {
          context.read<StoriesProvider>().longPressOnStory();
        },
        onLongPressUp: () {
          context.read<StoriesProvider>().longPressOnStoryEnd();
        },
        onTapUp: (details) =>
            context.read<StoriesProvider>().onTapUp(context, details),
        child: Stack(
          children: [
            PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: context.select(
                    (StoriesProvider provider) => provider.pageController),
                itemCount: context
                        .select(
                            (StoriesProvider provider) => provider.story?.pages)
                        ?.length ??
                    0,
                itemBuilder: (context, index) => Builder(builder: (context) {
                      return StoryPageView(
                          storyPage: context.select(
                              (StoriesProvider provider) =>
                                  provider.story?.pages)![index]);
                    })),
            Positioned(
                top: 20.0,
                left: 10.0,
                right: 10.0,
                child: Column(children: <Widget>[
                  Row(
                      children: _buildAnimationBar(
                          context.select((StoriesProvider provider) =>
                                  provider.story?.pages) ??
                              [],
                          context.select((StoriesProvider provider) =>
                              provider.animationController),
                          context.select((StoriesProvider provider) =>
                              provider.activePage)))
                ]))
          ],
        ),
      )),
    );
  }

  List<Widget> _buildAnimationBar(List<StoryPage> pages,
      AnimationController animationController, int activePage) {
    List<Widget> animationBarList = [];
    pages.asMap().forEach((key, value) {
      animationBarList.add(AnimatedBar(
        animController: animationController,
        position: key,
        currentIndex: activePage,
      ));
    });
    return animationBarList;
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:short_term_assignment/common/models/page.dart';
import 'package:short_term_assignment/common/models/stories.dart';
import 'package:short_term_assignment/common/theme/color.dart';

class StoriesProvider with ChangeNotifier {
  /// Arguments from previous page
  late Story? story;

  /// Constructor receives argument from Root widget
  StoriesProvider(Story? _story) {
    story = _story;
  }

  /// State variables
  PageController pageController = PageController();
  int activePage = 0;
  late AnimationController animationController;
  late BuildContext context;
  Color statusBarColor = Colors.white;

  /// Methods
  initializeAnimation(TickerProvider ticker) {
    animationController = AnimationController(vsync: ticker);
    final StoryPage? firstStory = story?.pages.first;
    renderStory(storyPage: firstStory, forwardPage: false);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.stop();
        animationController.reset();
        var storyLength = story?.pages.length ?? 0;
        if (activePage + 1 < storyLength) {
          activePage += 1;
          renderStory(storyPage: story?.pages[activePage]);
        } else {
          // activePage = 0;
          // renderStory(storyPage: story?.pages[activePage]);
          Navigator.pop(context);
        }
        notifyListeners();
      }
    });
  }

  storyTimeEnd() {
    print('next page');
    pageController.animateToPage(
      activePage,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );

    notifyListeners();
  }

  void renderStory(
      {StoryPage? storyPage, bool forwardPage = true, isSlide = false}) {
    animationController.stop();
    animationController.reset();
    statusBarColor = HexColor(storyPage?.backgroundColor ?? '#000000');
    int storyStringLength = 0;
    storyPage?.texts.forEach((element) {
      storyStringLength += element.text.length;
    });
    int durationMilliSeconds = storyStringLength * 20;
    Duration storyDuration = Duration(milliseconds: durationMilliSeconds);
    animationController.duration = storyDuration;
    animationController.forward();
    Duration animationDuration = Duration(milliseconds: 500);
    if (isSlide) {
      animationDuration = Duration(seconds: 1);
    }
    print("next page");
    if (forwardPage) {
      pageController.animateToPage(activePage,
          duration: animationDuration, curve: Curves.easeIn);
    }
  }

  void onTapUp(BuildContext context, TapUpDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      if (activePage - 1 >= 0) {
        activePage -= 1;
        renderStory(storyPage: story?.pages[activePage]);
      }
      print("Tap backward");
    } else if (dx > 2 * screenWidth / 3) {
      var length = story?.pages.length ?? 0;
      if (activePage + 1 < length) {
        activePage += 1;
        renderStory(storyPage: story?.pages[activePage]);
      } else {
        Navigator.of(context, rootNavigator: true).pop();
      }
      print("Tap forward");
    }

    notifyListeners();
  }

  disposeControllers() {
    animationController.dispose();
    pageController.dispose();
  }

  setContext(BuildContext _context) {
    context = _context;
  }

  longPressOnStory() {
    animationController.stop();
    notifyListeners();
  }

  longPressOnStoryEnd() {
    animationController.forward();
    notifyListeners();
  }

  // horizontalDragOnStory(DragEndDetails details) {
  //   if (details.primaryVelocity! < 0) {
  //     var length = story?.pages.length ?? 0;
  //     if (activePage + 1 < length) {
  //       activePage += 1;
  //       renderStory(storyPage: story?.pages[activePage], isSlide: true);
  //     } else {
  //       Navigator.of(context, rootNavigator: true).pop();
  //     }
  //   } else {
  //     if (activePage - 1 >= 0) {
  //       activePage -= 1;
  //       renderStory(storyPage: story?.pages[activePage], isSlide: true);
  //     }
  //   }
  // }
  setColor(Color color) {
    statusBarColor = color;
    notifyListeners();
  }
}

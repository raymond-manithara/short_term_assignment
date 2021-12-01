import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:short_term_assignment/common/models/page.dart';
import 'package:short_term_assignment/common/models/stories.dart';

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
  late Timer timer;
  late AnimationController animationController;
  late BuildContext context;

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

  initializeTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      var length = story?.pages.length ?? 0;
      if (activePage < length) {
        activePage++;
        notifyListeners();
        storyTimeEnd();
      } else {
        print('Timer cancelled');
        timer.cancel();
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

  void renderStory({StoryPage? storyPage, bool forwardPage = true}) {
    animationController.stop();
    animationController.reset();
    int storyStringLength = 0;
    storyPage?.texts.forEach((element) {
      storyStringLength += element.text.length;
    });
    int durationMilliSeconds = storyStringLength * 50;
    Duration storyDuration = Duration(milliseconds: durationMilliSeconds);
    animationController.duration = storyDuration;
    animationController.forward();
    print("next page");
    if (forwardPage) {
      pageController.animateToPage(activePage,
          duration: const Duration(seconds: 1), curve: Curves.easeIn);
    }
  }

  void onTapDown(BuildContext context, TapDownDetails details) {
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
        // Out of bounds - loop story
        // You can also Navigator.of(context).pop() here
        // activePage = 0;
        // renderStory(storyPage: story?.pages[activePage]);
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
}

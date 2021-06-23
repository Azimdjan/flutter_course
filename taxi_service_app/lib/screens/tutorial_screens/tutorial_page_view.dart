import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'tutorial_screen1.dart';
import 'tutorial_screen2.dart';
import 'tutorial_screen3.dart';

class TutorialPageView extends StatefulWidget {
  static const routeName = '/tutorial';
  const TutorialPageView({Key? key}) : super(key: key);

  @override
  _TutorialPageViewState createState() => _TutorialPageViewState();
}

class _TutorialPageViewState extends State<TutorialPageView> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          TutorialScreen1(controller: _controller,),
          TutorialScreen2(controller: _controller,),
          TutorialScreen3(controller: _controller,),
        ],
      ),
    );
  }
}

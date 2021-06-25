import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../theme.dart';
import 'tutorial_screen.dart';

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
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              TutorialScreen(
                controller: _controller,
                imageUrl: TaxiServiceAppTheme.image1,
                title: 'Confirm Your Driver',
                buttonText: 'Next',
                pageIndex: 0,
              ),
              TutorialScreen(
                controller: _controller,
                imageUrl: TaxiServiceAppTheme.image2,
                title: 'Request Driver',
                buttonText: 'Next',
                pageIndex: 1,
              ),
              TutorialScreen(
                controller: _controller,
                imageUrl: TaxiServiceAppTheme.image3,
                title: 'Track Your Ride',
                buttonText: 'Let\'s Start',
              ),
            ],
          ),
          Positioned(
            bottom: mediaQuery.height * 0.01,
            left: mediaQuery.width * 0.42,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(),
              onDotClicked: (index) => _controller.animateToPage(index,
                  duration: const Duration(seconds: 1), curve: Curves.linear),
            ),
          ),
        ],
      ),
    );
  }
}

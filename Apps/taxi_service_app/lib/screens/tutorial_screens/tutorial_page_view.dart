import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../auth_screens/signin_screen.dart';
import '../../layouts/with_out_appbar.dart';
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
    return LayoutWithOutAppBar(
      child: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
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
          top: 25,
          right: 10,
          child: TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignInScreen.routeName);
            },
            child: Text(
              'Skip',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
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
    );
  }
}

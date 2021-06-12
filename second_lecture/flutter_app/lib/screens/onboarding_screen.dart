import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/fooderlich_pages.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const OnBoardingScreen(),
      name: FooderlichPages.onBoardingPath,
      key: ValueKey(FooderlichPages.onBoardingPath),
    );
  }

  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Getting Started'),
        elevation: 0.0,
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: buildPages(),
            ),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false)
                .completeOnBoarding();
          },
          child: const Text('Skip'),
        ),
      ],
    );
  }

  Widget onBoardPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onBoardPageView(
            const AssetImage('assets/fooderlich_assets/recommend.png'),
            '''Check out weekly recommended recipes and what your friends are cooking!'''),
        onBoardPageView(const AssetImage('assets/fooderlich_assets/sheet.png'),
            'Cook with step by step instructions!'),
        onBoardPageView(const AssetImage('assets/fooderlich_assets/list.png'),
            'Keep track of what you need to buy'),
      ],
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(
        activeDotColor: rwColor,
      ),
    );
  }
}

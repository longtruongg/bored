import 'package:bored/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  final Color rwColor = Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getting started"),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildPage()),
            buildIdicator(),
            buildActionButton()
          ],
        ),
      ),
    );
  }

  Widget buildPage() {
    return PageView(
      controller: controller,
      children: [
        onboardPageView(
          const AssetImage('assets/recommend.png'),
          '''Check out weekly recommended recipes and what your friends are cooking!''',
        ),
        onboardPageView(
          const AssetImage('assets/sheet.png'),
          'Cook with step by step instructions!',
        ),
        onboardPageView(
          const AssetImage('assets/list.png'),
          'Keep track of what you need to buy',
        ),
      ],
    );
  }

  Widget buildIdicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(
        activeDotColor: rwColor,
      ),
    );
  }

  Widget buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text("Skip"),
          onPressed: () =>
              Provider.of<AppStateManager>(context, listen: false).onboarded(),
        )
      ],
    );
  }

  Widget onboardPageView(AssetImage assetImage, String s) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Image(
            image: assetImage,
            fit: BoxFit.cover,
          )),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            s,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

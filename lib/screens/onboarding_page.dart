import 'package:gym_appfin/screens/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:gym_appfin/widgets/onboarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gym_appfin/questions/gender.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  late List<Widget> _onBoardingPages;

  @override
  void initState() {
    super.initState();
    _onBoardingPages = [
      OnboardingCard(
        image: "assets/images/onboard2 (2).png",
        title: "SHAPE YOUR FUTURE",
        description: "TIME TO BEGIN",
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        },
      ),
      OnboardingCard(
        title: "START STRONG",
        description: "JOURNEY AWAITS",
        image: "assets/images/onboard1.png",
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        },
      ),
      OnboardingCard(
        image: "assets/images/onboard3.png",
        title: "MEET YOUR COACH",
        description: "START YOUR JOURNEY",
        buttonText: 'Done',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PickGender()),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onBoardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onBoardingPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: const Color(0xffff5722),
                dotColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
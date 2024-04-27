import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pap/Utils/animations.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/constants/onboarding_items.dart';
import 'package:pap/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Skip Button
                  TextButton(
                      onPressed: () => pageController
                          .jumpToPage(controller.items.length - 1),
                      child: const Text("IGNORAR")),

                  //Indicator
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn),
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: primaryColor,
                    ),
                  ),

                  //Next Button
                  TextButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      child: const Text("Avançar")),
                ],
              ),
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (index) => setState(
                () => isLastPage = controller.items.length - 1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image)
                      .animate(effects: Animations.imageOnPageLoadAnimation1),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontFamily: 'Outfit'),
                  ).animate(effects: Animations.textOnPageLoadAnimation1),
                  const SizedBox(height: 15),
                  Text(controller.items[index].descriptions,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontFamily: "Outfit"),
                          textAlign: TextAlign.center)
                      .animate(effects: Animations.textOnPageLoadAnimation2),
                ],
              );
            }),
      ),
    );
  }

  //Get started button

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: primaryColor),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: () async {
            final pres = await SharedPreferences.getInstance();
            pres.setBool("onboarding", true);

            //After we press get started button this onboarding value become true
            if (!mounted) return;
            Get.offAndToNamed(RouteGenerator.welcomePage);
          },
          child: const Text(
            "Começar",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

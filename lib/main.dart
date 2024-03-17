import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final bool isLoggedIn = false;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      initialRoute: _initialRoute(),
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      // home: const OnboardingView(),
    );
  }
}

String _initialRoute() {
  final AuthController authController = Get.find<AuthController>();
  return authController.isLogged.value
      ? RouteGenerator.homePage
      : RouteGenerator.loginPage;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';

void main() {
  runApp(const MyApp());
  initiateControllersAndServices();
}

void initiateControllersAndServices() {
  Get.put(AuthController());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn = false;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: _initialRoute(),
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
String _initialRoute() {
  final AuthController authController = Get.find<AuthController>();
  return authController.isLogged.value
      ? RouteGenerator.homePage // Use RouteGenerator.homePage directly for the initial route
      : RouteGenerator.homePage; // Or any other initial route for non-logged-in users
}


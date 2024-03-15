import 'package:flutter/material.dart';
import 'package:pap/views/screens/auth/login_screen.dart';
import 'package:pap/views/screens/auth/register_screen.dart';
import 'package:pap/views/screens/device_screen.dart';
import 'package:pap/views/screens/notifications_screen.dart';
import 'package:pap/views/screens/onboarding_screen.dart';
import 'package:pap/views/screens/profile_screen.dart';
import 'package:pap/views/screens/settings_screen.dart';
import 'package:pap/views/screens/welcome_screen.dart';
import 'package:pap/views/widgets/navbar_roots.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String profilePage = '/profile';
  static const String notificationPage = '/notifications';
  static const String settingsPage = '/settings';
  static const String welcomePage = '/welcome';
  static const String onboardingPage = '/onboarding';
  static const String devicePage = '/device';

  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const NavbarRoots());
      case onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case notificationPage:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case settingsPage:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case devicePage:
        return MaterialPageRoute(builder: (_) => const DeviceScreen());
      default:
        throw const FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}

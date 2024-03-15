import 'package:flutter/material.dart';
import 'package:pap/views/screens/auth/login_screen.dart';
import 'package:pap/views/screens/auth/register_screen.dart';
import 'package:pap/views/screens/notifications_screen.dart';
import 'package:pap/views/screens/profile_screen.dart';
import 'package:pap/views/screens/welcome_screen.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String profilePage = '/profile?user';
  static const String notificationPage = '/notifications';

  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case notificationPage:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      default:
        throw const FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}

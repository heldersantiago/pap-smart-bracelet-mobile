import 'package:flutter/material.dart';
import 'package:pap/views/screens/alerts_screen.dart';
import 'package:pap/views/screens/auth/login_screen.dart';
import 'package:pap/views/screens/auth/register_screen.dart';
import 'package:pap/views/screens/device_screen.dart';
import 'package:pap/views/screens/health_data_detail.dart';
import 'package:pap/views/screens/onboarding_screen.dart';
import 'package:pap/views/screens/profile_edit_screen.dart';
import 'package:pap/views/screens/profile_screen.dart';
import 'package:pap/views/screens/relatives/create_relative_screen.dart';
import 'package:pap/views/screens/relatives/edit_relative_screen.dart';
import 'package:pap/views/screens/relatives/relatives_screens.dart';
import 'package:pap/views/screens/relatives/show_relative_screen.dart';
import 'package:pap/views/screens/settings_screen.dart';
import 'package:pap/views/screens/splash_screen.dart';
import 'package:pap/views/screens/welcome_screen.dart';
import 'package:pap/views/widgets/navbar_roots.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String splashPage = '/splash';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String profilePage = '/profile';
  static const String profileEditPage = '/profile/edit';
  static const String notificationPage = '/notifications';
  static const String settingsPage = '/settings';
  static const String welcomePage = '/welcome';
  static const String onboardingPage = '/onboarding';
  static const String devicePage = '/device';
  static const String healthDetailPage = '/health/detail/:id';
  static const String listRelative = '/users/relatives';
  static const String createRelative = '/users/relatives/create';
  static const String editRelative = '/users/relatives/edit/:id';
  static const String deleteRelative = '/users/relatives/delete/:id';
  static const String showRelative = '/users/relatives/show/:id';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings,
      {bool useEffect = true}) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const NavbarRoots());
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboardingPage:
        return _buildPageRoute(const OnboardingView(), useEffect: useEffect);
      case welcomePage:
        return _buildPageRoute(const WelcomeView(), useEffect: useEffect);
      case loginPage:
        return _buildPageRoute(const LoginScreen(), useEffect: useEffect);
      case registerPage:
        return _buildPageRoute(const RegisterScreen(), useEffect: useEffect);
      case profilePage:
        return _buildPageRoute(ProfileScreen(), useEffect: useEffect);
      case profileEditPage:
        return _buildPageRoute(ProfileEditScreen(), useEffect: useEffect);
      case notificationPage:
        return _buildPageRoute(const AlertsScreen(), useEffect: useEffect);
      case settingsPage:
        return _buildPageRoute(SettingScreen(), useEffect: useEffect);
      case devicePage:
        return _buildPageRoute(const DeviceScreen(), useEffect: useEffect);
      case listRelative:
        return _buildPageRoute(const RelativeScreen(), useEffect: useEffect);
      case createRelative:
        return _buildPageRoute(const CreateRelativeScreen(),
            useEffect: useEffect);
      case editRelative:
        return _buildPageRoute(const EditRelativeScreen(),
            useEffect: useEffect);
      case showRelative:
        final int id = settings.arguments as int;
        return _buildPageRoute(
            ShowRelativeScreen(
              id: id,
            ),
            useEffect: useEffect);
      case deleteRelative:
        return _buildPageRoute(const DeviceScreen(), useEffect: useEffect);
      case healthDetailPage:
        final int id = settings.arguments as int;
        return _buildPageRoute(HealthDataDetailWidget(id: id),
            useEffect: useEffect);
      default:
        throw const FormatException("Route not found");
    }
  }

  static Route<dynamic> _buildPageRoute(Widget page, {bool useEffect = true}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (useEffect) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        } else {
          return child;
        }
      },
    );
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

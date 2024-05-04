import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:SMSI/controllers/auth_controller.dart';
import 'package:SMSI/routes.dart';
import 'package:SMSI/services/alerts_service.dart';
import 'package:SMSI/services/local_notifications.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  initiateControllersAndServices();
  WidgetsFlutterBinding.ensureInitialized();

  await LocalNotifications.init();

  //  handle in terminated state
  var initialNotification =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (initialNotification?.didNotificationLaunchApp == true) {
    // LocalNotifications.onClickNotification.stream.listen((event) {
    Future.delayed(const Duration(seconds: 1), () {
      // print(event);
      navigatorKey.currentState!.pushNamed(RouteGenerator.notificationPage,
          arguments: initialNotification?.notificationResponse?.payload);
    });
  }
  runApp(MyApp());
}

void initiateControllersAndServices() {
  Get.put(AuthController());
  Get.put(AlertService());
}

class MyApp extends StatelessWidget {
  final authController = Get.find<AuthController>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: _initialRoute(),
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }

  String _initialRoute() {
    return authController.isLogged.value
        ? RouteGenerator
            .homePage // Use RouteGenerator.homePage directly for the initial route
        : RouteGenerator
            .splashPage; // Or any other initial route for non-logged-in users
  }
}

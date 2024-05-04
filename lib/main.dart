import 'package:SMSI/controllers/auth_controller.dart';
import 'package:SMSI/routes.dart';
import 'package:SMSI/services/alerts_service.dart';
import 'package:SMSI/services/local_notifications.dart';
import 'package:SMSI/services/storage_service.dart';
import 'package:SMSI/views/screens/auth/login_screen.dart';
import 'package:SMSI/views/screens/home_screen.dart';
import 'package:SMSI/views/widgets/navbar_roots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initiateControllersAndServices();
  await LocalNotifications.init();

  runApp(MyApp());
}

Future<void> initiateControllersAndServices() async {
  Get.put(AuthController());
  Get.put(AlertService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      home: AuthCheckScreen(),
    );
  }
}

class AuthCheckScreen extends StatefulWidget {
  @override
  _AuthCheckScreenState createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  bool isLoggedIn = false;
  final authController = Get.find<AuthController>();


  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  Future<void> checkLoggedIn() async {
    var token = await StorageService.getToken();
    setState(() {
      isLoggedIn = token != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      authController.isLogged.value = true;
      return const NavbarRoots();
    } else {
      authController.isLogged.value = false;
      return const LoginScreen();
    }
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:pap/controllers/auth_controller.dart';

class UpdateData {
  AuthController authController = Get.find<AuthController>();
  late Timer _timer;

  Future<void> startUpdatingData() async {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) async {
      await authController.loadUserFromToken();
      print("Fui chamado");
    });
  }

  Future<void> stopUpdating() async {
    _timer.cancel();
  }
}

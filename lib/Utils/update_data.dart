import 'dart:async';

import 'package:get/get.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/services/alerts_service.dart';

class UpdateData {
  AuthController authController = Get.find<AuthController>();
  AlertService alertService = Get.find<AlertService>();
  late Timer _timer;

  Future<void> startUpdatingData() async {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) async {
      await authController.loadUserFromToken();
      await alertService.gettAlerts();
      print("Fui chamado");
    });
  }

  Future<void> stopUpdating() async {
    _timer.cancel();
  }
}

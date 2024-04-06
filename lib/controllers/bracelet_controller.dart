import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/Utils/utils.dart';
import 'package:pap/constants/endpoint.dart';
import 'package:pap/controllers/auth_controller.dart';

class BraceletController extends GetxController {
  final String _apiUrl = apiUrl;
  AuthController authController = Get.find<AuthController>();

  Future<void> create(String deviceId) async {
    final response = await http.post(
        Uri.parse(
          "$_apiUrl/bracelets/",
        ),
        body: {
          "device_id": deviceId,
          "user_id": authController.currentUser.value.id.toString(),
        });

    if (response.statusCode == 400) {
      final response0 = Utils.toJson(response.body);
      final String errorMessage = Utils.getError(response0['errors']);

      Get.snackbar("", "",
          titleText: const Text(""),
          messageText: Row(
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          colorText: Colors.white,
          borderRadius: 0,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10));
    }
    if (response.statusCode == 201) {
      Get.back();
      Get.snackbar("", "",
          titleText: const Text(""),
          messageText: const Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Bracelet adicionado com sucesso",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          colorText: Colors.white,
          borderRadius: 0,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10));
    }
  }
}

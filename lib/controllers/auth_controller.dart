import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/constants/endpoint.dart';
import 'package:pap/models/user.dart';
import 'package:pap/routes.dart';
import 'package:pap/services/storage_service.dart';
import 'package:pap/services/user_service.dart';

class AuthController extends GetxController {
  UserService userService = Get.put(UserService());

  final String _authUrl = authUrl;
  final String _apiUrl = apiUrl;
  var isLogged = false.obs;
  var isLoading = false.obs;
  var userId = 0.obs;
  var currentUser =
      User(name: "", email: "", password: "", relativeTie: "", braceletId: "")
          .obs;

  void login(String email, String password) async {
    final response = await http.post(
        Uri.parse(
          _authUrl,
        ),
        body: {'email': email, 'password': password});

    isLoading.value = true; // Start loading

    if (response.statusCode == 200) {
      final token = response.body;
      await StorageService.storeToken(token);

      isLoading.value = false; // end loading
      isLogged.value = true;

      await loadUserFromToken();
      Get.snackbar("Successo", "Logged in successfully",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));

      // Redirect to the home page when user is logged in
      Get.toNamed(RouteGenerator.homePage);
    } else {
      isLoading.value = false;
      Get.snackbar("Erro", "Credenciais inválidas",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }
  }

  Future<void> loadUserFromToken() async {
    final userPayload = await StorageService.getUserFromPayload();
    if (userPayload != null) {
      userId.value = userPayload.id!;
    }

    final user = await userService.getUser(userId.value);

    currentUser.value = user;
  }

  void register(User user) async {
    isLoading.value = false; // Start loading
    print(user.toJson());
  }

  Future<void> logout() async {
    await StorageService.removeToken();
    isLogged.value = false;
    isLoading.value = false;
    Get.offAllNamed(RouteGenerator.loginPage);
  }
}

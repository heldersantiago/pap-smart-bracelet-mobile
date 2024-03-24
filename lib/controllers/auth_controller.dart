import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/Utils/utils.dart';
import 'package:pap/constants/endpoint.dart';
import 'package:pap/models/register_error.dart';
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
  var registerError = RegisterError().obs;
  var currentUser = User().obs;

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
    isLoading.value = true; // Start loading

    final response = await http.post(
        Uri.parse(
          "$_apiUrl/users/",
        ),
        body: {
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "bracelet_id": user.braceletId,
          "relative_tie": user.relativeTie
        });

    if (response.statusCode == 201) {
      isLoading.value = false;
      Get.toNamed(RouteGenerator.loginPage);
      Get.snackbar("Sucesso", "Usuário cadastrado com sucesso",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }

    // bracelet not found
    if (response.statusCode == 404) {
      isLoading.value = false;
      final _response = Utils.toJson(response.body);
      final String errorMessage = Utils.getError(_response['errors']);
      Get.snackbar("Erro", errorMessage,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }

    // Email already exists
    if (response.statusCode == 400) {
      isLoading.value = false;
      final _response = Utils.toJson(response.body);
      final String errorMessage = Utils.getError(_response['errors']);
      Get.snackbar("Erro", errorMessage,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }
  }

  Future<void> logout() async {
    await StorageService.removeToken();
    isLogged.value = false;
    isLoading.value = false;
    Get.offAllNamed(RouteGenerator.loginPage);
  }
}

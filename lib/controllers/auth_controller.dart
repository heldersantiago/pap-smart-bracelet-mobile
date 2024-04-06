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
  RxInt UserId = 0.obs;
  var registerError = RegisterError().obs;
  var currentUser = User().obs;

  void login(String emailOrPhone, String password) async {
    Map<String, String> data = {};

    if (emailOrPhone.contains('@')) {
      data['email'] = emailOrPhone; // input is an email
    } else {
      data['phone'] = emailOrPhone; // input is a phone number
    }

    final response = await http.post(
        Uri.parse(
          _authUrl,
        ),
        body: {'password': password, ...data});

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
    final userId = await StorageService.getUserIdFromPayload();
    if (userId != null) {
      UserId.value = int.tryParse(userId)!;
    }

    final user = await userService.getUser(UserId.value);
    currentUser.value = user;
  }

  void register(User user) async {
    isLoading.value = true; // Start loading

    final response = await http.post(
        Uri.parse(
          "$_apiUrl/users/elderlies",
        ),
        body: {
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "role_id": user.roleId
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

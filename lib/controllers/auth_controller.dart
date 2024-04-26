import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/Utils/utils.dart';
import 'package:pap/constants/endpoint.dart';
import 'package:pap/models/register_error.dart';
import 'package:pap/models/user.dart';
import 'package:pap/routes.dart';
import 'package:pap/services/alerts_service.dart';
import 'package:pap/services/storage_service.dart';
import 'package:pap/services/user_service.dart';

class AuthController extends GetxController {
  UserService userService = Get.put(UserService());

  // AlertService alertService = Get.put(AlertService());

  final String _authUrl = authUrl;
  final String _apiUrl = apiUrl;
  var isLogged = false.obs;
  var isLoading = false.obs;
  RxInt UserId = 0.obs;
  var registerError = RegisterError().obs;
  var currentUser = User().obs;

  Future<void> login(String emailOrPhone, String password) async {
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
      Get.offAndToNamed(RouteGenerator.homePage);
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
    isLoading.value = true;
    final userId = await StorageService.getUserIdFromPayload();
    if (userId != null) {
      UserId.value = int.tryParse(userId)!;
    }

    final user = await userService.getUser(UserId.value);
    currentUser.value = user;
    isLoading.value = false;
  }

  void register(User user) async {
    isLoading.value = true; // Start loading

    final response = await http.post(
        Uri.parse(
          "$_apiUrl/users/elderlies/",
        ),
        body: {
          "name": user.name,
          "email": user.email,
          "phone": user.phone,
          "password": user.password,
          "role_id": "2"
        });

    if (response.statusCode == 201) {
      isLoading.value = false;
      Get.offAndToNamed(RouteGenerator.loginPage);
      Get.snackbar("Sucesso", "Usuário cadastrado com sucesso",
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }

    if (response.statusCode == 400) {
      isLoading.value = false;
      final response0 = Utils.toJson(response.body);
      final String errorMessage = Utils.getError(response0['errors']);
      Get.snackbar("Erro", errorMessage,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }

    // Email already exists
    if (response.statusCode == 500) {
      isLoading.value = false;

      final response1 = Utils.toJson(response.body);
      final String errorMessage = Utils.getError(response1['error'] is String
          ? response1['errors']
          : "is not a string arriving");
      Get.snackbar("Erro", errorMessage,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.only(top: 5));
    }
  }

  Future<void> logout() async {
    AlertService alertService = Get.find<AlertService>();
    await StorageService.removeToken();
    isLogged.value = false;
    isLoading.value = false;
    alertService.alerts = RxList();
    currentUser.value = User(); // to clean
    Get.offAllNamed(RouteGenerator.loginPage);
  }
}

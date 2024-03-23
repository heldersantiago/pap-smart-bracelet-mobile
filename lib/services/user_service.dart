import 'dart:convert';

import 'package:get/get.dart';
import 'package:pap/constants/endpoint.dart';
import 'package:pap/models/user.dart';
import 'package:http/http.dart' as http;

class UserService extends GetxService {
  final String _apiUrl = "$apiUrl/users";
  final String _authUrl = authUrl;

  Future<bool> loginAsync(String email, String password) async {
    final response = await http.post(
      Uri.parse(_authUrl),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      Get.put(user);
      return true;
    } else {
      return false;
    }
  }

  Future<User> getUser(int userId) async {
    final response = await http.get(Uri.parse('$_apiUrl/$userId'));
    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

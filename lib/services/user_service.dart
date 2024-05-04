import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:SMSI/constants/endpoint.dart';
import 'package:SMSI/models/user.dart';

class UserService extends GetxService {
  final String _apiUrl = "$apiUrl/users/elderlies";
  final String _apiUrl1 = "$apiUrl/users/relatives";
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

  Future<User> getUserElderly(int userId) async {
    print('Elderlies');
    final response = await http.get(Uri.parse('$_apiUrl/$userId'));
    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<User> getUserRelative(int userId) async {
    print('Relatives');
    final response = await http.get(Uri.parse('$_apiUrl1/$userId'));
    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

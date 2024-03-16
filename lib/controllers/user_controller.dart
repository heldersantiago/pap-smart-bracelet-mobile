import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/models/user.dart';

class UserController extends GetxController {
  var url = Uri.https('127.0.0.1:3001', '/api/v1/users/', {'q': '{http}'});
  Future<User> getUser(String id) async {
    final response = await http.get(url);
    final user = jsonDecode(response.body);
    return user;
  }
}

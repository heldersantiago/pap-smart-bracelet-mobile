import 'dart:convert'; // Import this for json.decode

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/constants/endpoint.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/models/alert.dart'; // Import your Notification model

class AlertService extends GetxService {
  final authController = Get.find<AuthController>();
  var alerts = <Alert>[].obs;
  final _apiUrl = apiUrl;

  Future<void> GetAlerts() async {
    final bracelet_id = authController.currentUser.value.bracelet!.id;
    // Use http.get to fetch data from the API
    final response = await http.get(Uri.parse('$_apiUrl/alerts/$bracelet_id'));

    if (response.statusCode == 200) {
      // Parse the response body into a list of notifications
      final List<dynamic> jsonData = json.decode(response.body);
      alerts.value = jsonData.map((json) => Alert.fromJson(json)).toList();
      print(jsonData);
      print("Values from alerts obs");
      print(alerts.value);
      // return alerts.value;
    } else {
      throw Exception('Failed to fetch alerts');
    }
  }

  Future<void> alertRead(int id) async {
    // Use http.get to fetch data from the API

    final response = await http.put(
        Uri.parse(
          "$_apiUrl/alerts/$id",
        ),
        body: {
          "isActive": "false",
        });

    if (response.statusCode == 200) {
      // Parse the response body into a list of notifications
      print("success");
      // return alerts.value;
    } else {
      throw Exception('Failed to update alert after read fetch alerts');
    }
  }
}

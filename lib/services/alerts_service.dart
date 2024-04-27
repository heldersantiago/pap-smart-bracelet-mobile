import 'dart:convert'; // Import this for json.decode

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pap/constants/endpoint.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/models/alert.dart';
import 'package:pap/services/local_notifications.dart';

class AlertService extends GetxService {
  final authController = Get.find<AuthController>();
  var alerts = <Alert>[].obs;
  final _apiUrl = apiUrl;

  Future<void> GetAlerts() async {
    final braceletId = authController.currentUser.value.bracelet!.id;
    // Use http.get to fetch data from the API
    final response = await http.get(Uri.parse('$_apiUrl/alerts/$braceletId'));

    if (response.statusCode == 200) {
      // Parse the response body into a list of notifications
      final List<dynamic> jsonData = json.decode(response.body);
      // Get the number of new alerts if exists
      final newAlerts = jsonData.length - alerts.length;

      // notify and show  the new alerts
      for (int i = 0; i < newAlerts; i++) {
        final alert = Alert.fromJson(jsonData[jsonData.length - (i + 1)]);
        await showAlert(alert);
      }

      alerts.value = jsonData.map((json) => Alert.fromJson(json)).toList();
      // return alerts.value;
    } else {
      throw Exception('Failed to fetch alerts');
    }
  }

  Future<void> showAlert(Alert alert) async {
    LocalNotifications.showSimpleNotification(
        title: alert.title!,
        body: alert.description!,
        payload: alert.id.toString());
  }

  Future<void> alertRead(int id) async {
    final response = await http.put(
        Uri.parse(
          "$_apiUrl/alerts/$id",
        ),
        body: {
          "isActive": "false",
        });

    if (response.statusCode == 200) {
      // Parse the response body into a list of alerts
      print("alert read success");
      // return alerts.value;
    } else {
      throw Exception('Failed to update alert after read fetch alerts');
    }
  }
}

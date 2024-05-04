import 'dart:convert'; // Import this for json.decode

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:SMSI/constants/endpoint.dart';
import 'package:SMSI/controllers/auth_controller.dart';
import 'package:SMSI/interfaces/user_service.dart';
import 'package:SMSI/models/alert.dart';
import 'package:SMSI/services/local_notifications.dart';

class AlertService extends GetxService implements IAlertService {
  final authController = Get.find<AuthController>();
  var alerts = <Alert>[].obs;
  final _baseUrl = apiUrl;

  @override
  Future<void> gettAlerts() async {
    final braceletId = authController.currentUser.value.bracelet!.id;
    // Use http.get to fetch data from the API
    final response = await http.get(Uri.parse('$_baseUrl/alerts/$braceletId'));

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

  @override
  Future<void> showAlert(Alert alert) async {
    LocalNotifications.showSimpleNotification(
        title: alert.title!,
        body: alert.description!,
        payload: alert.id.toString());
  }

  @override
  Future<void> alertRead(int id) async {
    final response = await http.put(
        Uri.parse(
          "$_baseUrl/alerts/$id",
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

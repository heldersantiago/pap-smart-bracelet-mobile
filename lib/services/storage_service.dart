import 'dart:convert';

import 'package:pap/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String tokenKey = "token";
  static Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageService.tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageService.tokenKey);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageService.tokenKey);
  }

  static Future<User?> getUserFromPayload() async {
    final token = await getToken();
    if (token == null) {
      return null;
    }

    final parts = token.split('.');

    if (parts.length != 3) {
      throw Exception('Invalid token format');
    }

    final encodedPayload = parts[1];

    // Attempt decoding payload with standard padding
    try {
      final decodedPayload = base64Url.decode(encodedPayload.padRight((encodedPayload.length + 4 - encodedPayload.length % 4) % 4, '='));
      final payloadJson = utf8.decode(decodedPayload);
      final payload = json.decode(payloadJson);
      return User.fromJson(payload);
    } catch (e) {
      print('Error decoding payload with standard padding: $e');
    }

    // Attempt decoding payload with base64 padding
    try {
      final paddedPayload = encodedPayload.padRight((encodedPayload.length + 4 - encodedPayload.length % 4) % 4, '=');
      final decodedPayload = base64Url.decode(paddedPayload);
      final payloadJson = utf8.decode(decodedPayload);
      final payload = json.decode(payloadJson);
      return User.fromJson(payload);
    } catch (e) {
      print('Error decoding payload with base64 padding: $e');
    }

    throw Exception('Failed to decode payload');
  }

  static String _padBase64(String input) {
    final int missingPaddingLength = 4 - input.length % 4;
    return input + '=' * missingPaddingLength;
  }
}

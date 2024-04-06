import 'dart:convert';

class Utils {
  static String getError(String error) {
    switch (error) {
      case "bracelet not found":
        return "Dispositivo não encontrado";
      case "user not found":
        return "usuário não encontrado";
      case "Validation error":
        return "Já existe um usuário com este email";
      case "Elderly with this phone number already exist":
        return "Já existe um usuário com este número de telefone";
      case "Bracelet with this user_id already exist":
        return "Pulseira já possui um usuário";
      case "Bracelet with this device_id already exist":
        return "Pulseira já e uso";
      default:
        return "Já existe um usuário com este email";
    }
  }

  static Map<String, dynamic> toJson(String m) {
    return json.decode(m);
  }
}

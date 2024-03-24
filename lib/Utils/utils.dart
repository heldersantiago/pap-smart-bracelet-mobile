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
      default:
        return "";
    }
  }

  static Map<String, dynamic> toJson(String m){
    return json.decode(m);
  }
}

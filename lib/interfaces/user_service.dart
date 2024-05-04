import 'package:SMSI/models/alert.dart';

abstract class UserService {
  Future<bool> login(String email, String password);

  Future<bool> register(String email, String password);
}

abstract class IAlertService {
  Future<void> showAlert(Alert alert);

  Future<void> gettAlerts();

  Future<void> alertRead(int id);
}

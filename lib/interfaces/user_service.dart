abstract class UserService {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
}

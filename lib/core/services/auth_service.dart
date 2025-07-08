abstract class AuthService {
  
  Future<String> register(String name, String surname, String phoneNumber, String email, String password);

  Future<String> login(String email, String password);
 
  Future<void> logout();
}

abstract class AuthService {
  Future<dynamic> login({required String email, required String password});
  Future<dynamic> register({required String email, required String password});
}

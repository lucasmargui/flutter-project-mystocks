import '../../common/models/models.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  });
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

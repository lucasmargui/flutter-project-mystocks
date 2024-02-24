import 'package:mystock_app/common/models/user_model.dart';
import 'package:mystock_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      //Simulando um erro
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(id: email.hashCode, name: name, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Digite uma nova senha forte.';
      }
      throw 'Não foi possivel criar sua conta nesse momento. Tente mais tarde';
    }
  }
}

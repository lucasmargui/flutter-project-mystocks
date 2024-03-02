// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import '../../features/sign_in/sign_in.dart';
import '../../services/services.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState _state = SignInInitialState();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  //Função faça o login
  Future<void> signIn({required String email, required String password}) async {
    const secureStorage = SecureStorageService();

    _changeState(SignInLoadingState());

    try {
      final user = await _service.signIn(email: email, password: password);

      if (user.id != null) {
        secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignInSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}

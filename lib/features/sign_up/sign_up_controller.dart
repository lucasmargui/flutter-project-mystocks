// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import '../../features/sign_up/sign_up.dart';

import '../../services/services.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();

  final AuthService _service;
  SignUpController(this._service);

  //Privamos o objeto _state para que ele só possa ser alterado dentro da classe
  //para recuperarmos esse valo utilizamos o get state
  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  //Função faça o login
  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final secureStorage = SecureStorageService();

    _changeState(SignUpLoadingState());

    try {
      final user =
          await _service.signUp(name: name, email: email, password: password);

      if (user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignUpSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}

// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mystock_app/features/sign_up/sign_up_state.dart';

import '../../services/auth_service.dart';

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
  Future<void> SignUp(
      {required String name,
      required String email,
      required String password}) async {
    //
    _changeState(SignUpLoadingState());

    try {
      await _service.signUp(name: name, email: email, password: password);

      _changeState(SignUpSuccessState());
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}

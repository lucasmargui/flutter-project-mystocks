// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mystock_app/features/sign_up/sign_up_state.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();

  //Privamos o objeto _state para que ele só possa ser alterado dentro da classe
  //para recuperarmos esse valo utilizamos o get state
  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  //Função faça o login
  Future<bool> doSignUp() async {
    //
    _changeState(SignUpLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 2));
      //throw Exception("Erro ao logar");
      log('Usuário logado com sucesso');

      _changeState(SignUpSuccessState());
      return true;
    } catch (e) {
      _changeState(SignUpErrorState());
      return false;
    }
  }
}

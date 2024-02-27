// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mystock_app/features/sign_up/sign_up_state.dart';
import 'package:mystock_app/features/splash/splash_state.dart';

import '../../services/auth_service.dart';
import '../../services/secure_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorageService _service;

  SplashController(this._service);

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(Duration(seconds: 1));

    final result = await _service.readOne(key: "CURRENT_USER");

    if (result != null) {
      _changeState(SplashSuccessState());
    } else {
      _changeState(SplashErrorState());
    }
  }
}

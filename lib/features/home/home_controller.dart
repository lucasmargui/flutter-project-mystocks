// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:mystock_app/features/home/home_state.dart';
import 'package:mystock_app/repositories/transaction_repository.dart';

import 'package:mystock_app/services/secure_storage.dart';

import '../../common/models/transaction_model.dart';
import '../../services/auth_service.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;

  HomeController(this._transactionRepository);

  HomeState _state = HomeInitialState();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(HomeLoadingState());

    try {
      _transactions = await _transactionRepository.getAllTransactions();

      _changeState(HomeSuccessState());
    } catch (e) {
      _changeState(HomeErrorState(e.toString()));
    }
  }
}

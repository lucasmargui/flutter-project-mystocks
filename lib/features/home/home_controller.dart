// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../features/home/home_state.dart';
import '../../repositories/transaction_repository.dart';

import '../../common/models/models.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;

  HomeController(this._transactionRepository);

  HomeState _state = HomeInitialState();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  late PageController _pageController;
  PageController get pageController => _pageController;

  set setPageController(PageController newPageController) {
    _pageController = newPageController;
  }

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(HomeLoadingState());

    final result = await _transactionRepository.getAllTransactions();

    result.fold(
      (error) => _changeState(HomeErrorState(error.message)),
      (data) {
        _transactions = data;
        _transactions.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        _changeState(HomeSuccessState());
      },
    );
  }
}

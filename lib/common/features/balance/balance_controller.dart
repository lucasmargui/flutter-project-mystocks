import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../features/wallet/wallet.dart';
import '../../../locator.dart';
import '../../../repositories/transaction_repository.dart';
import '../../../repositories/transaction_repository_list.dart';
import '../../models/models.dart';
import 'balance_state.dart';

class BalanceController extends ChangeNotifier {
  final TransactionRepository transactionRepository;

  BalanceController({required this.transactionRepository});

  BalanceState _state = BalanceInitialState();

  BalanceState get state => _state;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  BalancesModel _balances = BalancesModel(
    totalIncome: 0,
    totalOutcome: 0,
    totalBalance: 0,
  );

  BalancesModel get balances => _balances;

  void _changeState(BalanceState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getBalances() async {
    _changeState(BalanceLoadingState());

    // final result = await transactionRepository.getAllTransactions();
    // double totalIncome = 0;
    // double totalOutcome = 0;
    // double totalBalance = 0;
    // result.fold(
    //   (error) => _changeState(BalanceErrorState()),
    //   (data) {
    //     for (TransactionModel transaction in data) {
    //       totalBalance += transaction.value;
    //       if (transaction.value < 0) {
    //         totalOutcome += transaction.value;
    //       } else {
    //         totalIncome += transaction.value;
    //       }
    //     }

    //     _balances = BalancesModel(
    //         totalIncome: totalIncome,
    //         totalOutcome: totalOutcome,
    //         totalBalance: totalBalance);
    //     _changeState(BalanceSuccessState());
    //   },
    // );

    double totalIncome = 0;
    double totalOutcome = 0;
    double totalBalance = 0;

    for (TransactionModel transaction
        in GenerateTransactionList().transactions) {
      totalBalance += transaction.value;
      if (transaction.value < 0) {
        totalOutcome += transaction.value;
      } else {
        totalIncome += transaction.value;
      }
    }

    _balances = BalancesModel(
        totalIncome: totalIncome,
        totalOutcome: totalOutcome,
        totalBalance: totalBalance);
    _changeState(BalanceSuccessState());
  }

  void changeSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
  }

  Future<void> getBalancesByDateRange() async {
    _changeState(BalanceLoadingState());

    final result = await transactionRepository.getBalancesByDateRange(
      startDate: DateTime(_selectedDate.year, _selectedDate.month, 0),
      endDate: DateTime(_selectedDate.year, _selectedDate.month + 1, 0),
    );

    result.fold(
      (error) => _changeState(BalanceErrorState()),
      (data) {
        _balances = data;

        _changeState(BalanceSuccessState());
      },
    );
  }

  Future<void> updateBalance(
      {TransactionModel? oldTransaction,
      required TransactionModel newTransaction}) async {
    _changeState(BalanceLoadingState());

    double totalIncome = 0;
    double totalOutcome = 0;
    double totalBalance = 0;

    for (TransactionModel transaction
        in GenerateTransactionList().transactions) {
      totalBalance += transaction.value;
      if (transaction.value < 0) {
        totalOutcome += transaction.value;
      } else {
        totalIncome += transaction.value;
      }
    }

    _balances = BalancesModel(
        totalIncome: totalIncome,
        totalOutcome: totalOutcome,
        totalBalance: totalBalance);
    _changeState(BalanceSuccessState());
  }
}

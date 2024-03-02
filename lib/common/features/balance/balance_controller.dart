import 'package:flutter/foundation.dart';

import '../../../repositories/transaction_repository.dart';
import '../../models/models.dart';
import 'balance_state.dart';

class BalanceController extends ChangeNotifier {
  BalanceController({
    required this.transactionRepository,
  });

  final TransactionRepository transactionRepository;

  BalanceState _state = BalanceInitialState();

  BalanceState get state => _state;

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

    final result = await transactionRepository.getBalances();
    _balances = result;

    _changeState(BalanceSuccessState());
  }

  Future<void> updateBalance(
      {TransactionModel? oldTransaction,
      required TransactionModel newTransaction}) async {
    final result = await transactionRepository.getBalances();

    _changeState(BalanceSuccessState());
  }
}

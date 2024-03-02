import 'package:flutter/foundation.dart';

import '../../../repositories/transaction_repository.dart';
import '../../../services/secure_storage.dart';
import '../../models/transaction_model.dart';
import '../../models/user_model.dart';
import 'transaction_state.dart';

class TransactionController extends ChangeNotifier {
  TransactionController({
    required this.transactionRepository,
    required this.secureStorageService,
  });

  final SecureStorageService secureStorageService;
  final TransactionRepository transactionRepository;

  TransactionState _state = TransactionInitialState();

  TransactionState get state => _state;

  void _changeState(TransactionState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    _changeState(TransactionLoadingState());

    final data = await secureStorageService.readOne(key: 'CURRENT_USER');
    final user = UserModel.fromJson(data ?? '');
    final result = await transactionRepository.addTransaction(
      transaction: transaction,
      userId: user.id!,
    );

    _changeState(TransactionSuccessState());
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    _changeState(TransactionLoadingState());
    final result =
        await transactionRepository.updateTransaction(transaction: transaction);

    _changeState(TransactionSuccessState());
  }

  Future<void> deleteTransaction(TransactionModel transaction) async {
    _changeState(TransactionLoadingState());
    final result =
        await transactionRepository.deleteTransaction(transaction: transaction);

    _changeState(TransactionSuccessState());
  }
}

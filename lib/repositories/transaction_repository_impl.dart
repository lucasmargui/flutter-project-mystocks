import 'dart:developer';

import 'package:mystock_app/common/data/data.dart';
import 'package:mystock_app/common/extensions/extensions.dart';
import 'package:mystock_app/repositories/transaction_repository_list.dart';

import '../common/models/models.dart';
import 'extensions.dart/generate_random_number.dart';
import 'transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<TransactionModel> addTransaction({
    required TransactionModel transaction,
    required String userId,
  }) async {
    try {
      return TransactionModel(
          category: 'Income',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransactionModel> updateTransaction(
      {required TransactionModel transaction}) async {
    try {
      return TransactionModel(
          category: 'Income',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransactionModel> deleteTransaction(
      {required TransactionModel transaction}) async {
    try {
      return TransactionModel(
          category: 'Other',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<List<TransactionModel>>> getAllTransactions() async {
    return DataResult.success(GenerateTransactionList().transactions);
  }

  @override
  Future<DataResult<List<TransactionModel>>> getTransactionsByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    try {
      log(startDate.toText);
      log(endDate.toText);
      var data = GenerateTransactionList()
          .transactions
          .where((transaction) =>
              DateTime.fromMillisecondsSinceEpoch(transaction.date)
                  .isAfter(startDate) &&
              DateTime.fromMillisecondsSinceEpoch(transaction.date)
                  .isBefore(endDate))
          .toList();

      return DataResult.success(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<BalancesModel>> getBalances() async {
    try {
      return DataResult.success(BalancesModel(
          totalIncome: 500.00, totalOutcome: 200.00, totalBalance: 1300.00));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<BalancesModel>> getBalancesByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    try {
      double totalIncome = 0;
      double totalOutcome = 0;
      double totalBalance = 0;
      var data = GenerateTransactionList()
          .transactions
          .where((transaction) =>
              DateTime.fromMillisecondsSinceEpoch(transaction.date)
                  .isAfter(startDate) &&
              DateTime.fromMillisecondsSinceEpoch(transaction.date)
                  .isBefore(endDate))
          .toList();

      for (TransactionModel transaction in data) {
        totalBalance += transaction.value;
        if (transaction.value < 0) {
          totalOutcome += transaction.value;
        } else {
          totalIncome += transaction.value;
        }
      }

      return DataResult.success(BalancesModel(
          totalIncome: totalIncome,
          totalOutcome: totalOutcome,
          totalBalance: totalBalance));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BalancesModel> updateBalances({required BalancesModel balance}) async {
    try {
      return BalancesModel(
          totalIncome: 100.00, totalOutcome: 100.00, totalBalance: 2300.00);
    } catch (e) {
      rethrow;
    }
  }
}

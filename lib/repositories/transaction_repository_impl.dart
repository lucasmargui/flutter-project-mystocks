import 'dart:developer';

import 'package:mystock_app/common/data/data.dart';
import 'package:mystock_app/common/extensions/extensions.dart';

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
    final List<TransactionModel> list = [
      TransactionModel(
        category: 'Other',
        description: "Bar",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 5)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 5)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Other',
        description: "VideoGame",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Other',
        description: "Site",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 24)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 24)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Other',
        description: "Cartão",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Other',
        description: "Cartão",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Other',
        description: "Cartão",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Other',
        description: "Cartão",
        value: GenerateRandomNumber.generate(),
        date:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 36)).millisecondsSinceEpoch,
      ),
    ];

    return DataResult.success(list);
  }

  @override
  Future<DataResult<List<TransactionModel>>> getTransactionsByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    try {
      final List<TransactionModel> list = [
        TransactionModel(
          category: 'Other',
          description: "Bar",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .subtract(const Duration(days: 5))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .subtract(const Duration(days: 5))
              .millisecondsSinceEpoch,
        ),
        TransactionModel(
          category: 'Other',
          description: "VideoGame",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .subtract(const Duration(days: 7))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .subtract(const Duration(days: 7))
              .millisecondsSinceEpoch,
        ),
        TransactionModel(
          category: 'Other',
          description: "Site",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .subtract(const Duration(days: 13))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .subtract(const Duration(days: 13))
              .millisecondsSinceEpoch,
        ),
        TransactionModel(
          category: 'Other',
          description: "Cartão",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .add(const Duration(days: 7))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .add(const Duration(days: 7))
              .millisecondsSinceEpoch,
        ),
        TransactionModel(
          category: 'Other',
          description: "Cartão",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .add(const Duration(days: 9))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .add(const Duration(days: 9))
              .millisecondsSinceEpoch,
        ),
        TransactionModel(
          category: 'Other',
          description: "Cartão",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .add(const Duration(days: 15))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .add(const Duration(days: 18))
              .millisecondsSinceEpoch,
        ),
        TransactionModel(
          category: 'Other',
          description: "Cartão",
          value: GenerateRandomNumber.generate(),
          date: DateTime.now()
              .add(const Duration(days: 25))
              .millisecondsSinceEpoch,
          status: true,
          createdAt: DateTime.now()
              .add(const Duration(days: 25))
              .millisecondsSinceEpoch,
        ),
      ];

      log(startDate.toText);
      log(endDate.toText);
      var data = list
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
  Future<BalancesModel> updateBalances({required BalancesModel balance}) async {
    try {
      return BalancesModel(
          totalIncome: 100.00, totalOutcome: 100.00, totalBalance: 2300.00);
    } catch (e) {
      rethrow;
    }
  }
}

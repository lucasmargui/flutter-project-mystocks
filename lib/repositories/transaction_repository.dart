import 'package:mystock_app/common/data/data.dart';

import '../common/models/models.dart';

abstract class TransactionRepository {
  Future<TransactionModel> addTransaction({
    required TransactionModel transaction,
    required String userId,
  });
  Future<TransactionModel> updateTransaction(
      {required TransactionModel transaction});
  Future<TransactionModel> deleteTransaction(
      {required TransactionModel transaction});

  Future<DataResult<List<TransactionModel>>> getAllTransactions();

  Future<DataResult<BalancesModel>> getBalances();

  Future<BalancesModel> updateBalances({required BalancesModel balance});
}

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
  Future<DataResult<List<TransactionModel>>> getAllTransactions() async {
    final List<TransactionModel> list = [
      TransactionModel(
        category: 'Income',
        description: "Bar",
        value: 500,
        date:
            DateTime.now().add(const Duration(days: 5)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 5)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Expense',
        description: "VideoGame",
        value: -200,
        date:
            DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Income',
        description: "Site",
        value: 150.52,
        date:
            DateTime.now().add(const Duration(days: 24)).millisecondsSinceEpoch,
        status: true,
        createdAt:
            DateTime.now().add(const Duration(days: 24)).millisecondsSinceEpoch,
      ),
      TransactionModel(
        category: 'Income',
        description: "Cartão",
        value: 325.45,
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

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

  Future<List<TransactionModel>> getAllTransactions();

  Future<List<BalancesModel>> getBalances();

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
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      TransactionModel(
          category: 'Income',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804),
      TransactionModel(
          category: 'Income',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804),
      TransactionModel(
          category: 'Income',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804),
      TransactionModel(
          category: 'Income',
          description: "Descricao",
          value: 500,
          date: 1468959781804,
          status: true,
          createdAt: 1468959781804),
    ];
  }

  @override
  Future<List<BalancesModel>> getBalances() async {
    try {
      return [
        BalancesModel(
            totalIncome: 500.00, totalOutcome: 200.00, totalBalance: 1300.00),
        BalancesModel(
            totalIncome: 300.00, totalOutcome: 300.00, totalBalance: 12300.00),
        BalancesModel(
            totalIncome: 5200.00, totalOutcome: 500.00, totalBalance: 3300.00),
        BalancesModel(
            totalIncome: 200.00, totalOutcome: 100.00, totalBalance: 44300.00),
        BalancesModel(
            totalIncome: 100.00, totalOutcome: 100.00, totalBalance: 2300.00),
      ];
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

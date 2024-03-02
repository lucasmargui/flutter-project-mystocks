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
        date: 48498,
        description: 'teste',
        value: 500,
        status: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransactionModel> updateTransaction(
      {required TransactionModel transaction}) async {
    try {
      return TransactionModel(
        date: 48498,
        description: 'teste',
        value: 500,
        status: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TransactionModel> deleteTransaction(
      {required TransactionModel transaction}) async {
    try {
      return TransactionModel(
        date: 48498,
        description: 'teste',
        value: 500,
        status: true,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      TransactionModel(
          description: 'Salary',
          value: 500,
          date: DateTime.now().millisecondsSinceEpoch,
          status: true),
      TransactionModel(
        description: 'Dinner',
        value: -50,
        date: DateTime.now()
            .subtract(const Duration(days: 4))
            .millisecondsSinceEpoch,
        status: true,
      ),
      TransactionModel(
        description: 'Bar',
        value: -75,
        date: DateTime.now().millisecondsSinceEpoch,
        status: true,
      ),
      TransactionModel(
        description: 'Cripto',
        value: 458,
        date: DateTime.now()
            .subtract(const Duration(days: 3))
            .millisecondsSinceEpoch,
        status: true,
      ),
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

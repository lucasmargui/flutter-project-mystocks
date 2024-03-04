import 'package:mystock_app/common/data/data.dart';
import 'package:mystock_app/repositories/transaction_repository_list.dart';
import '../common/models/models.dart';
import 'transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<DataResult<TransactionModel>> addTransaction({
    required TransactionModel transaction,
    required String userId,
  }) async {
    try {
      ////Lógica de inserção de dados

      return DataResult.success(transaction);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<TransactionModel>> updateTransaction(
      {required TransactionModel transaction}) async {
    try {
      ////Lógica de atualização de dados

      return DataResult.success(transaction);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<TransactionModel>> deleteTransaction(
      {required TransactionModel transaction}) async {
    try {
      ////Lógica de remoção de dados
      return DataResult.success(transaction);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<List<TransactionModel>>> getAllTransactions() async {
    ////Lógica de leitura de dados

    return DataResult.success(GenerateTransactionList().transactions);
  }

  @override
  Future<DataResult<List<TransactionModel>>> getTransactionsByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    try {
      ////Lógica de leitura de dados com filtro

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
      ////Lógica de leitura de dados
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

      return DataResult.success(BalancesModel(
          totalIncome: totalIncome,
          totalOutcome: totalOutcome,
          totalBalance: totalBalance));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataResult<BalancesModel>> getBalancesByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    try {
      ////Lógica de leitura com filtro
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
  Future<DataResult<BalancesModel>> updateBalances(
      {required BalancesModel balance}) async {
    try {
      ////Lógica de atualização de dados
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

      return DataResult.success(BalancesModel(
          totalIncome: totalIncome,
          totalOutcome: totalOutcome,
          totalBalance: totalBalance));
    } catch (e) {
      rethrow;
    }
  }
}

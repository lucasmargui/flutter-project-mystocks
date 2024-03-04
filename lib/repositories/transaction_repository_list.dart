import '../common/models/models.dart';
import 'extensions.dart/generate_random_number.dart';

class GenerateTransactionList {
  static final GenerateTransactionList _instance =
      GenerateTransactionList._internal();

  factory GenerateTransactionList() {
    return _instance;
  }

  GenerateTransactionList._internal();

  List<TransactionModel> transactions = [
    TransactionModel(
      id: "1",
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
      id: "2",
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
      id: "3",
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
      id: "4",
      category: 'Other',
      description: "Cartão",
      value: GenerateRandomNumber.generate(),
      date: DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
      status: true,
      createdAt:
          DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch,
    ),
    TransactionModel(
      id: "5",
      category: 'Other',
      description: "Cartão",
      value: GenerateRandomNumber.generate(),
      date: DateTime.now().add(const Duration(days: 9)).millisecondsSinceEpoch,
      status: true,
      createdAt:
          DateTime.now().add(const Duration(days: 9)).millisecondsSinceEpoch,
    ),
    TransactionModel(
      id: "6",
      category: 'Other',
      description: "Cartão",
      value: GenerateRandomNumber.generate(),
      date: DateTime.now().add(const Duration(days: 15)).millisecondsSinceEpoch,
      status: true,
      createdAt:
          DateTime.now().add(const Duration(days: 18)).millisecondsSinceEpoch,
    ),
    TransactionModel(
      id: "7",
      category: 'Other',
      description: "Cartão",
      value: GenerateRandomNumber.generate(),
      date: DateTime.now().add(const Duration(days: 25)).millisecondsSinceEpoch,
      status: true,
      createdAt:
          DateTime.now().add(const Duration(days: 25)).millisecondsSinceEpoch,
    ),
  ];
}

class TransactionModel {
  final String description;
  final double value;
  final int date;
  final bool status;

  TransactionModel({
    required this.description,
    required this.value,
    required this.date,
    required this.status,
  });
}

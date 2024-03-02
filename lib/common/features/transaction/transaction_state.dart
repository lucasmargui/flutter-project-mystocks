abstract class TransactionState {}

class TransactionInitialState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionSuccessState extends TransactionState {}

class TransactionErrorState extends TransactionState {
  TransactionErrorState({required this.message});

  final String message;
}

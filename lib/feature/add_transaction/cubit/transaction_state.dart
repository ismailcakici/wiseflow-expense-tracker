part of 'transaction_cubit.dart';

class TransactionState extends Equatable {
  const TransactionState({
    required this.transactions,
  });
  final List<Transaction> transactions;

  @override
  List<Object> get props => [transactions];
}

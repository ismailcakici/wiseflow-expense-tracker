import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class Transaction extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final num amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final bool isExpense;

  const Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.isExpense});

  @override
  List<Object?> get props => [id, title, amount, date, isExpense];
}

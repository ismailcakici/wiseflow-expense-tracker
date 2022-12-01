import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseflow/product/model/chart/chart_model.dart';
import 'package:wiseflow/product/model/transaction/transaction_model.dart';

import '../../../product/init/cache/cache_manager.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit()
      : super(TransactionState(
            transactions: CacheManager.getInstance.getAllTransactions()));

  Future<void> addTransaction(Transaction transaction, String uuid) async {
    await CacheManager.getInstance.addTransaction(transaction, uuid);
    emit(TransactionState(
        transactions: CacheManager.getInstance.getAllTransactions()));
  }

  Future<void> deleteTransaction(String key) async {
    await CacheManager.getInstance.deleteTransaction(key);
    emit(TransactionState(
        transactions: CacheManager.getInstance.getAllTransactions()));
  }

  Future<void> clearCache() async {
    await CacheManager.getInstance.clearCache();
    emit(TransactionState(
        transactions: CacheManager.getInstance.getAllTransactions()));
  }

  List<ChartData> getDailySections() {
    List<ChartData> sections = [];
    List<Transaction> dailyExpenses = getDailyExpenses();

    sections = dailyExpenses
        .map(
          (e) => ChartData(
            name: e.title,
            amount: e.amount.toDouble(),
          ),
        )
        .toList();

    return sections;
  }

  List<Transaction> getDailyExpenses() {
    List<Transaction> dailyExpenses = [];
    DateTime now = DateTime.now();
    for (var e in state.transactions) {
      if (e.isExpense == true &&
          e.date.day == now.day &&
          e.date.month == now.month &&
          e.date.year == now.year) {
        dailyExpenses.add(e);
      }
    }

    return dailyExpenses;
  }

  List<ChartData> getWeeklySections() {
    List<ChartData> sections = [];
    List<Transaction> weeklyExpenses = getWeeklyExpenses();

    sections = weeklyExpenses
        .map((e) => ChartData(
              name: e.title,
              amount: e.amount.toDouble(),
            ))
        .toList();

    return sections;
  }

  List<Transaction> getWeeklyExpenses() {
    List<Transaction> weeklyExpenses = [];

    for (var e in state.transactions) {
      if (e.isExpense == true &&
          e.date.isBefore(DateTime.now()) &&
          e.date.isAfter(DateTime.now().subtract(const Duration(days: 6)))) {
        weeklyExpenses.add(e);
      }
    }
    return weeklyExpenses;
  }

  List<ChartData> getMonthlySections() {
    List<ChartData> sections = [];
    List<Transaction> monthlyExpenses = getMonthlyExpenses();

    sections = monthlyExpenses
        .map((e) => ChartData(
              name: e.title,
              amount: e.amount.toDouble(),
            ))
        .toList();

    return sections;
  }

  List<Transaction> getMonthlyExpenses() {
    List<Transaction> monthlyExpenses = [];

    for (var e in state.transactions) {
      if (e.isExpense == true &&
          e.date.isBefore(DateTime.now()) &&
          e.date.isAfter(DateTime.now().subtract(const Duration(days: 29)))) {
        monthlyExpenses.add(e);
      }
    }
    return monthlyExpenses;
  }

  double getIncomes(List<Transaction> transactions) {
    List<Transaction> incomeList = [];
    for (var e in transactions) {
      if (e.isExpense == false) {
        incomeList.add(e);
      }
    }
    List<double> incomes = incomeList.map((e) => e.amount.toDouble()).toList();
    double result = incomes.fold(0, (p, c) => p + c);
    return result;
  }

  double getExpense(List<Transaction> transactions) {
    List<Transaction> expenseList = [];
    for (var e in transactions) {
      if (e.isExpense == true) {
        expenseList.add(e);
      }
    }
    List<double> expenses =
        expenseList.map((e) => e.amount.toDouble()).toList();
    double result = expenses.fold(0, (p, c) => p + c);
    return result;
  }

  double getTotalBalance(List<Transaction> transactions) {
    double allExpenses = getExpense(transactions);
    double allIncomes = getIncomes(transactions);
    double result = allIncomes - allExpenses;
    return result;
  }
}

import 'package:hive_flutter/adapters.dart';
import 'package:wiseflow/product/model/transaction/transaction_model.dart';

class CacheManager {
  late Box<Transaction> box;
  initCache() async {
    Hive.registerAdapter(TransactionAdapter());
    await Hive.initFlutter();
    box = await Hive.openBox('myBox');
  }

  List<Transaction> getAllTransactions() =>
      box.values.toList().reversed.toList();

  Future<void> addTransaction(Transaction transaction, String key) async =>
      box.put(key, transaction);
  Future<void> deleteTransaction(String key) async => box.delete(key);
  Future<void> clearCache() async {
    await box.clear();
  }

  static final CacheManager _instance = CacheManager._init();
  CacheManager._init();
  static CacheManager get getInstance => _instance;
}

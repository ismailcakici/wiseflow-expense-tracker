import 'package:flutter/cupertino.dart';
import 'package:wiseflow/product/init/cache/cache_manager.dart';
import 'package:wiseflow/product/init/localization/localizaton_manager.dart';

class ProductInit {
  initProduct() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalizationManager.getInstance.initLocalization();
    await CacheManager.getInstance.initCache();
  }

  static final ProductInit _instance = ProductInit._init();
  ProductInit._init();
  static ProductInit get getInstance => _instance;
}

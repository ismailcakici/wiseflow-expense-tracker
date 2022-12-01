class AppConstants {
  final String appTitle = 'WiseFlow';
  final String localizationPath = 'assets/localization';

  static final AppConstants _instance = AppConstants._init();
  AppConstants._init();

  static AppConstants get getInstance => _instance;
}

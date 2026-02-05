enum Flavor { staging, production }

class AppConfig {
  static AppConfig? _instance;

  static AppConfig get instance {
    assert(_instance != null, 'AppConfig not initialized');
    return _instance!;
  }

  static void init(AppConfig config) {
    assert(_instance == null, 'AppConfig already initialized');
    _instance = config;
  }

  final String baseUrl;
  final Flavor flavor;

  AppConfig({required this.baseUrl, required this.flavor});
}

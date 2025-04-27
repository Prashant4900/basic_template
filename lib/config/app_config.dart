import 'package:appwrite_app/config/env_config.dart';
import 'package:appwrite_app/config/flavor.dart';

class AppConfig {
  AppConfig._({required Flavor flavor}) : _flavor = flavor;

  static Future<void> init({required Flavor flavor}) async {
    // Initialize environment config first
    final envFileName = getEnvFileName(flavor);
    await EnvConfig.init(fileName: envFileName);

    // Initialize app configurations based on the flavor
    AppConfig._instance = AppConfig._(flavor: flavor);
  }

  static AppConfig get instance {
    if (_instance == null) {
      throw Exception(
        'AppConfig is not initialized. Call AppConfig.init() first.',
      );
    }
    return _instance!;
  }

  static EnvConfig get env => AppConfig.instance.envConfig;

  static AppConfig? _instance;

  final Flavor _flavor;
  Flavor get flavor => _flavor;

  // Get the EnvConfig instance
  EnvConfig get envConfig => EnvConfig.instance;

  bool get isDebug => _flavor == Flavor.development;
}

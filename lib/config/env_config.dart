import 'package:appwrite_app/config/flavor.dart';
import 'package:appwrite_app/utility/app_logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvKey {
  env('ENV');

  const EnvKey(this.key);
  final String key;
}

/// Returns the filename for the environment configuration file based on the given [flavor].
///
/// The following files are used for each flavor:
///
/// - [Flavor.development]: `.dev.env`
/// - [Flavor.production]: `.prod.env`
/// - [Flavor.staging]: `.staging.env`
String getEnvFileName(Flavor flavor) {
  switch (flavor) {
    case Flavor.development:
      return '.dev.env';
    case Flavor.production:
      return '.prod.env';
    case Flavor.staging:
      return '.staging.env';
  }
}

class EnvConfig {
  // Private constructor
  EnvConfig._({required this.fileName});

  final String fileName;

  // Static instance for singleton pattern
  static EnvConfig? _instance;

  /// Get the singleton instance of EnvConfig
  static EnvConfig get instance {
    if (_instance == null) {
      throw Exception(
        'EnvConfig is not initialized. Call EnvConfig.init() first.',
      );
    }
    return _instance!;
  }

  /// Initialize the environment configuration
  static Future<EnvConfig> init({required String fileName}) async {
    try {
      AppLogger.info('Loading environment from $fileName');
      await dotenv.load(fileName: fileName);
      AppLogger.info('Environment loaded successfully');

      _instance = EnvConfig._(fileName: fileName);
      return _instance!;
    } catch (e) {
      AppLogger.error('Failed to load environment file $fileName: $e');
      rethrow;
    }
  }

  /// Retrieves the value of an environment variable.
  String? get(EnvKey envKey) {
    _checkInitialization();
    return dotenv.env[envKey.key];
  }

  /// Retrieves the value of an environment variable with a default value.
  String getString(EnvKey envKey, {String defaultValue = ''}) {
    _checkInitialization();
    return dotenv.env[envKey.key] ?? defaultValue;
  }

  /// Retrieves the value of an environment variable as a boolean.
  bool getBool(EnvKey envKey, {bool defaultValue = false}) {
    _checkInitialization();
    final value = dotenv.env[envKey.key];
    return value != null ? value.toLowerCase() == 'true' : defaultValue;
  }

  /// Retrieves the value of an environment variable as an integer.
  int getInt(EnvKey envKey, {int defaultValue = 0}) {
    _checkInitialization();
    final value = dotenv.env[envKey.key];
    return value != null ? int.tryParse(value) ?? defaultValue : defaultValue;
  }

  /// Retrieves the value of an environment variable as a double.
  double getDouble(EnvKey envKey, {double defaultValue = 0.0}) {
    _checkInitialization();
    final value = dotenv.env[envKey.key];
    return value != null
        ? double.tryParse(value) ?? defaultValue
        : defaultValue;
  }

  /// Retrieves the value of an environment variable as a list of strings.
  List<String> getList(EnvKey envKey, {List<String> defaultValue = const []}) {
    _checkInitialization();
    final value = dotenv.env[envKey.key];
    return value?.split(',') ?? defaultValue;
  }

  /// Checks if dotenv is initialized before attempting to access values
  void _checkInitialization() {
    if (!dotenv.isInitialized) {
      throw Exception('Environment variables not loaded.');
    }
  }
}

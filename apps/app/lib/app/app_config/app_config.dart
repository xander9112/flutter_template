import 'package:app/app/app_env.dart';
import 'package:envied/envied.dart';

part 'app_config.g.dart';

abstract interface class IAppConfig {
  /// {@macro i_app_config}
  IAppConfig();

  /// Наименование сервиса конфигурации
  String get name => 'IAppConfig';

  /// Основной адрес для запросов к API
  String get baseUrl;

  /// Тип окружения (dev, prod, stage)
  AppEnv get env;

  /// Секретный ключ для шифрования данных
  String get secretKey;

  /// Нужна ли авторизация для входа в приложение
  bool get isAuthRequired;
}

@Envied(name: 'Dev', path: 'env/dev.env')
class AppConfigDev implements IAppConfig {
  /// {@macro app_config_dev}
  AppConfigDev();

  @override
  AppEnv get env => .dev;

  @override
  String get name => 'AppConfigDev';

  @override
  @EnviedField()
  final String baseUrl = _Dev.baseUrl;

  @override
  @EnviedField()
  final bool isAuthRequired = _Dev.isAuthRequired;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Dev.secretKey;
}

@Envied(name: 'Prod', path: 'env/prod.env')
class AppConfigProd implements IAppConfig {
  /// {@macro app_config_prod}
  AppConfigProd();

  @override
  AppEnv get env => .prod;

  @override
  String get name => 'AppConfigProd';

  @override
  @EnviedField(obfuscate: true)
  final String baseUrl = _Prod.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Prod.secretKey;

  @override
  @EnviedField()
  final bool isAuthRequired = _Prod.isAuthRequired;
}

@Envied(name: 'Stage', path: 'env/stage.env')
class AppConfigStage implements IAppConfig {
  /// {@macro app_config_stage}
  AppConfigStage();

  @override
  AppEnv get env => .stage;

  @override
  String get name => 'AppConfigStage';

  @override
  @EnviedField(obfuscate: true)
  final String baseUrl = _Stage.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Stage.secretKey;

  @override
  @EnviedField()
  final bool isAuthRequired = _Stage.isAuthRequired;
}

import 'package:app/app/app_config/app_config.dart';
import 'package:app/features/debug/i_debug_service.dart';
import 'package:dio/dio.dart';

final class AppHttpClient {
  AppHttpClient({
    required IDebugService debugService,
    required IAppConfig appConfig,
    Duration connectTimeout = const Duration(seconds: 5),
    Duration sendTimeout = const Duration(seconds: 7),
    Duration receiveTimeout = const Duration(seconds: 10),
  }) {
    _httpClient = Dio();

    _httpClient.options
      ..baseUrl = appConfig.baseUrl
      ..connectTimeout = connectTimeout
      ..sendTimeout = sendTimeout
      ..receiveTimeout = receiveTimeout
      ..headers = {'Content-Type': 'application/json'};
    debugService.log('HTTP client created');

    addInterceptor(debugService.dioLogger);
  }

  /// Экземпляр HTTP клиента
  late final Dio _httpClient;

  Dio get client => _httpClient;

  void addInterceptor(Interceptor interceptor) {
    _httpClient.interceptors.add(interceptor);
  }
}

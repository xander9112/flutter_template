import 'package:dependencies/dependencies.dart';

class ErrorInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final originalResponse = err.response;

    if (originalResponse != null) {
      return super.onError(err, handler);
    } else {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: Response(
            requestOptions: err.requestOptions,
            data: {
              'error': {
                'code': err.type.name,
                'message': '',
                'timestamp': DateTime.now().toIso8601String(),
              },
            },
          ),
          type: err.type,
          error: err.error,
          message: err.message,
          stackTrace: err.stackTrace,
        ),
      );
    }
  }
}

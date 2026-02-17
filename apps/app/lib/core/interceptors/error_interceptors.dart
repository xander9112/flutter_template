import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class ErrorInterceptors extends Interceptor {
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
                'code': toUpperSnakeCase(err.type.name),
                'message': err.message,
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

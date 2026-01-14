import 'package:quiz/core/_core.dart';
import 'package:yx_scope/yx_scope.dart';

class ScopeObserverImpl implements ScopeObserver {
  ScopeObserverImpl({required AppLogger logger}) : _logger = logger;

  final AppLogger _logger;

  @override
  void onScopeDisposeDepFailed(
    ScopeId scope,
    DepId dep,
    Object exception,
    StackTrace stackTrace,
  ) {
    _logger.info('onScopeDisposeDepFailed: ScopeId $scope, DepId $dep');
  }

  @override
  void onScopeDisposed(ScopeId scope) {
    _logger.info('onScopeDisposed: ScopeId $scope');
  }

  @override
  void onScopeInitializeFailed(
    ScopeId scope,
    Object exception,
    StackTrace stackTrace,
  ) {
    _logger.info('onScopeInitializeFailed: ScopeId $scope, Object $exception');
  }

  @override
  void onScopeInitialized(ScopeId scope) {
    _logger.info('onScopeInitialized: ScopeId $scope');
  }

  @override
  void onScopeStartDispose(ScopeId scope) {
    _logger.info('onScopeStartDispose: ScopeId $scope');
  }

  @override
  void onScopeStartInitialize(ScopeId scope) {
    _logger.info('onScopeStartInitialize: ScopeId $scope');
  }
}

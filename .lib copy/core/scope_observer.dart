import 'package:quiz/features/debug/_debug.dart';
import 'package:yx_scope/yx_scope.dart';

class ScopeObserverImpl implements ScopeObserver {
  ScopeObserverImpl({required IDebugService logger}) : _logger = logger;

  final IDebugService _logger;

  @override
  void onScopeDisposeDepFailed(
    ScopeId scope,
    DepId dep,
    Object exception,
    StackTrace stackTrace,
  ) {
    _logger.logDebug('onScopeDisposeDepFailed: ScopeId $scope, DepId $dep');
  }

  @override
  void onScopeDisposed(ScopeId scope) {
    _logger.logDebug('onScopeDisposed: ScopeId $scope');
  }

  @override
  void onScopeInitializeFailed(
    ScopeId scope,
    Object exception,
    StackTrace stackTrace,
  ) {
    _logger.logDebug(
      'onScopeInitializeFailed: ScopeId $scope, Object $exception',
    );
  }

  @override
  void onScopeInitialized(ScopeId scope) {
    _logger.logDebug('onScopeInitialized: ScopeId $scope');
  }

  @override
  void onScopeStartDispose(ScopeId scope) {
    _logger.logDebug('onScopeStartDispose: ScopeId $scope');
  }

  @override
  void onScopeStartInitialize(ScopeId scope) {
    _logger.logDebug('onScopeStartInitialize: ScopeId $scope');
  }
}

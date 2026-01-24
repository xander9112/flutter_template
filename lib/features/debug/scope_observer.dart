import 'package:quiz/features/debug/i_debug_service.dart';
import 'package:yx_scope/yx_scope.dart';

class ScopeObserverImpl implements ScopeObserver {
  ScopeObserverImpl({required IDebugService debugService})
    : _debugService = debugService;

  final IDebugService _debugService;

  @override
  void onScopeDisposeDepFailed(
    ScopeId scope,
    DepId dep,
    Object exception,
    StackTrace stackTrace,
  ) {
    _debugService.logDebug(
      'onScopeDisposeDepFailed: ScopeId $scope, DepId $dep',
    );
  }

  @override
  void onScopeDisposed(ScopeId scope) {
    _debugService.logDebug('onScopeDisposed: ScopeId $scope');
  }

  @override
  void onScopeInitializeFailed(
    ScopeId scope,
    Object exception,
    StackTrace stackTrace,
  ) {
    _debugService.logDebug(
      'onScopeInitializeFailed: ScopeId $scope, Object $exception',
    );
  }

  @override
  void onScopeInitialized(ScopeId scope) {
    _debugService.logDebug('onScopeInitialized: ScopeId $scope');
  }

  @override
  void onScopeStartDispose(ScopeId scope) {
    _debugService.logDebug('onScopeStartDispose: ScopeId $scope');
  }

  @override
  void onScopeStartInitialize(ScopeId scope) {
    _debugService.logDebug('onScopeStartInitialize: ScopeId $scope');
  }
}

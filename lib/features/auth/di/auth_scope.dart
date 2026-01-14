import 'package:quiz/app/_app.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AuthScope implements Scope {
  AuthManager get authManager;
}

class AuthScopeContainer extends ChildScopeContainer<RootScope>
    implements AuthScope {
  AuthScopeContainer({required super.parent}) : super(name: 'AuthScope');

  // @override
  // List<Set<AsyncDep<dynamic>>> get initializeQueue => [
  //   {_authService},
  // ];

  @override
  AuthManager get authManager => parent.authManagerDep.get;
}

class AuthScopeHolder
    extends BaseChildScopeHolder<AuthScope, AuthScopeContainer, RootScope> {
  AuthScopeHolder(super.parent)
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);
  @override
  AuthScopeContainer createContainer(RootScope parent) =>
      AuthScopeContainer(parent: parent);

  Future<void> initScope() async {
    if (scope != null) {
      // await drop();
      return;
    }

    await create();
  }
}

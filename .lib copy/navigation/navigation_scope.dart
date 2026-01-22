import 'package:auto_route/auto_route.dart';
import 'package:quiz/app/root_scope.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/router/app_auto_router.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class NavigationScope implements Scope {
  // NavigationScope
  RootStackRouter get router;
}

class NavigationScopeContainer extends ChildScopeContainer<RootScope>
    implements NavigationScope {
  NavigationScopeContainer({required super.parent})
    : super(name: 'NavigationScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [{}];

  @override
  RootStackRouter get router =>
      AppAutoRouter(manager: parent.authScopeHolder.scope!.authManager);
}

class NavigationScopeHolder
    extends
        BaseChildScopeHolder<
          NavigationScope,
          NavigationScopeContainer,
          RootScope
        > {
  NavigationScopeHolder(super.parent)
    : super(scopeObservers: [ScopeObserverImpl(logger: parent.debugService)]);

  @override
  NavigationScopeContainer createContainer(RootScope parent) =>
      NavigationScopeContainer(parent: parent);
}

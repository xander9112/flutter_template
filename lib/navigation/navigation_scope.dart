import 'package:auto_route/auto_route.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/_features.dart';
import 'package:quiz/router/app_auto_router.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class NavigationScope implements Scope {
  // NavigationScope
  RootStackRouter get router;
}

class NavigationScopeContainer extends ChildScopeContainer<AuthScope>
    implements NavigationScope {
  NavigationScopeContainer({required super.parent})
    : super(name: 'NavigationScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [{}];

  @override
  RootStackRouter get router => AppAutoRouter();
}

class NavigationScopeHolder
    extends
        BaseChildScopeHolder<
          NavigationScope,
          NavigationScopeContainer,
          AuthScope
        > {
  NavigationScopeHolder(super.parent)
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);

  @override
  NavigationScopeContainer createContainer(AuthScope parent) =>
      NavigationScopeContainer(parent: parent);
}

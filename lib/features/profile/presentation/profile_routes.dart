abstract final class ProfileRoutes {
  /// Название роута главной страницы
  static const String profileScreenName = 'profile_screen';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  // static StatefulShellBranch buildShellBranch({
  //   List<RouteBase> routes = const [],
  //   List<NavigatorObserver>? observers,
  // }) => StatefulShellBranch(
  //   initialLocation: _profileScreenPath,
  //   observers: observers,
  //   routes: [
  //     GoRoute(
  //       path: _profileScreenPath,
  //       name: profileScreenName,
  //       builder: (context, state) => const ProfileScreen(),
  //       routes: routes,
  //     ),
  //   ],
  // );
}

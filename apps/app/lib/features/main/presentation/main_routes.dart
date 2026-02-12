import 'package:app/app/_app.dart';
import 'package:auto_route/auto_route.dart';

abstract final class MainRoutes {
  /// Название роута главной страницы
  static const String mainScreenName = 'main_screen';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static final routes = [
    CustomRoute<void>(
      transitionsBuilder: TransitionsBuilders.noTransition,
      path: '',
      page: MainRoute.page,
      children: [
        AutoRoute(path: 'home', initial: true, page: HomeRoute.page),

        AutoRoute(path: 'profile', page: ProfileRoute.page),
      ],
    ),
  ];
}

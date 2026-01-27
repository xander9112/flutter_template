import 'package:auto_route/auto_route.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

abstract final class MainRoutes {
  /// Название роута главной страницы
  static const String mainScreenName = 'main_screen';

  /// Название роута экрана с деталями
  static const String mainDetailScreenName = 'main_detail_screen';

  /// Путь роута страницы профиля пользователя
  static const String _mainScreenPath = '/main';

  /// Путь роута экрана с деталями
  static const String _mainDetailScreenPath = '/main/detail';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static final routes = [
    CustomRoute(
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

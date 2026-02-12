import 'package:app/app/_app.dart';
import 'package:auto_route/auto_route.dart';

final debugRoutes = [
  CustomRoute<void>(
    transitionsBuilder: TransitionsBuilders.noTransition,
    path: '/debug',
    page: DebugRootRoute.page,
    children: [
      AutoRoute(path: '', initial: true, page: DebugRoute.page),

      AutoRoute(path: 'tokens', page: TokensRoute.page),

      AutoRoute(path: 'ui-kit', page: UiKitRoute.page),

      AutoRoute(path: 'icons', page: IconsRoute.page),

      AutoRoute(path: 'theme', page: ThemeRoute.page),

      AutoRoute(path: 'lang', page: LangRoute.page),

      AutoRoute(path: 'components', page: ComponentsRoute.page),
    ],
  ),
];

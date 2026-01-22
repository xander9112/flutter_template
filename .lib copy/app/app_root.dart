// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quiz/app/_app.dart';
// import 'package:quiz/features/_features.dart';
// import 'package:quiz/navigation/_navigation.dart';
// import 'package:yx_scope_flutter/yx_scope_flutter.dart';

// class AppRoot extends StatefulWidget {
//   const AppRoot({super.key});

//   @override
//   State<AppRoot> createState() => _AppRootState();
// }

// class _AppRootState extends State<AppRoot> {
//   late final RootScopeHolder _rootScopeHolder;

//   @override
//   void initState() {
//     _rootScopeHolder = RootScopeHolder()..create();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _rootScopeHolder.drop();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     /// RootScope -> SettingsScope -> AuthScope -> NavigationScope -> Material / Cupertino App -> RunnerScope  -> остальное

//     /// RootScope
//     /// - Logger
//     /// - Dio
//     /// - Firebase

//     /// SettingsScope
//     /// Темы (Отдельные Scope)
//     /// Локализация (Отдельные Scope)
//     /// Проверка обновления
//     /// и др.

//     /// AuthScope - Добавить понятие сессии, чтобы привязать обновление данных для каждой сесcии
//     /// Хранит состояние аутентификации / блокировки / верификации
//     /// Аутентификация / Регистрация

//     /// RunnerScope
//     /// Получение настроек с бэка через SettingsScope
//     /// Проверяем авторизован ли пользователь через AuthScope

//     return ScopeProvider<RootScope>(
//       holder: _rootScopeHolder,
//       child: ScopeBuilder<RootScope>.withPlaceholder(
//         builder: (context, scope) {
//           return ScopeProvider<SettingsScope>(
//             holder: SettingsScopeHolder(scope)..create(),
//             child: ScopeBuilder<SettingsScope>.withPlaceholder(
//               builder: (context, settingsScope) {
//                 print('das');
//                 return ScopeProvider<AuthScope>(
//                   holder: AuthScopeHolder(scope)..create(),
//                   child: ScopeBuilder<AuthScope>.withPlaceholder(
//                     builder: (context, authScope) {
//                       return ScopeProvider<NavigationScope>(
//                         holder: NavigationScopeHolder(authScope)..create(),
//                         child: ScopeBuilder<NavigationScope>.withPlaceholder(
//                           builder: (context, navScope) {
//                             return BlocProvider<SettingsCubit>.value(
//                               value: settingsScope.settingsCubit,
//                               child: BlocBuilder<SettingsCubit, SettingsState>(
//                                 builder: (context, state) {
//                                   return MaterialApp.router(
//                                     debugShowCheckedModeBanner: false,
//                                     themeMode: state.themeMode,
//                                     theme: ThemeData.light(),
//                                     darkTheme: ThemeData.dark(),
//                                     routerConfig: navScope.router.config(
//                                       includePrefixMatches: true,
//                                       reevaluateListenable:
//                                           authScope.authManager,
//                                       // deepLinkBuilder: (deepLink) {
//                                       //   return DeepLink.path('/profile/info');
//                                       // },
//                                     ),
//                                     builder: (context, child) {
//                                       return AppWrap(
//                                         settingsState: state,
//                                         child: child,
//                                       );
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:app/app/_app.dart';
import 'package:app/features/profile/domain/bloc/profile_bloc.dart';
import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

/// {@template profile_screen}
/// Экран профиля пользователя.
///
/// Отвечает за:
/// - Инициализацию ProfileBloc с репозиторием профиля
/// - Отображение данных профиля пользователя
/// - Обработку состояний загрузки, успеха и ошибок
/// {@endtemplate}
@RoutePage()
class ProfileScreen extends StatelessWidget {
  /// {@macro profile_screen}
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileRepository = context.di.repositories.profileRepository;
    // Инициализируем ProfileBloc с репозиторием и загружаем данные профиля
    return BlocProvider(
      create: (context) =>
          ProfileBloc(profileRepository)
            ..add(const ProfileFetchProfileEvent(id: '1')),
      child: const _ProfileScreenView(),
    );
  }
}

/// {@template profile_screen_view}
/// Виджет для отображения UI экрана профиля.
///
/// Отображает данные профиля в зависимости от состояния ProfileBloc:
/// - Индикатор загрузки во время получения данных
/// - Данные профиля при успешной загрузке
/// - Сообщение об ошибке при неудачной загрузке
/// {@endtemplate}
class _ProfileScreenView extends StatelessWidget {
  /// {@macro profile_screen_view}
  const _ProfileScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile page'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SettingsRoute()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ScopeBuilder<AuthScope>.withPlaceholder(
        builder: (context, scope) {
          return StreamBuilder(
            initialData: scope.authManager.authStatus.value,
            stream: scope.authManager.authStatus,
            builder: (context, snapshot) {
              if (scope.authManager.authStatus.value.isAuthenticated) {
                return Center(
                  child: ElevatedButton(
                    onPressed: scope.authManager.signOut,
                    child: const Text('SignOut'),
                  ),
                );
              }

              return Center(
                child: ElevatedButton(
                  onPressed: () => scope.authManager.signIn('demo', 'demo'),
                  child: const Text('SignIn'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

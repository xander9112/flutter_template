import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/app_context_ext.dart';
import 'package:quiz/features/update/domain/state/cubit/update_cubit.dart';
import 'package:quiz/features/update/presentation/components/soft_modal_sheet.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

/// {@template root_screen}
/// Корневой экран приложения с навигационной структурой.
///
/// Отвечает за:
/// - Отображение основного навигационного интерфейса
/// - Управление переключением между основными разделами приложения
/// - Отображение кнопки отладки в не-продакшн окружениях
/// - Интеграцию с GoRouter для навигации
/// {@endtemplate}
@RoutePage()
class RootScreen extends StatefulWidget {
  /// {@macro root_screen}
  const RootScreen({super.key});

  /// Текущая ветка навигации от GoRouter
  /// Содержит информацию о текущем состоянии навигации

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    // После построения виджета, проверяем состояние кубита обновлений
    // и если есть обновление, то показываем модальное окно
    _checkSoftUpdate();
  }

  /// Проверяет состояние кубита обновлений и показывает модальное окно при наличии мягкого обновления
  void _checkSoftUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final updateState = context.read<UpdateCubit>().state;

      // Проверяем только состояние успеха с доступной информацией об обновлении
      if (updateState is UpdateSuccessState &&
          updateState.updateInfo.updateType == .soft) {
        unawaited(
          SoftUpdateModal.show(
            context,
            updateEntity: updateState.updateInfo,
            onUpdate: () {
              // TODO(yura): реализовать логику обновления приложения
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [MainRoute(), ProfileRoute()],
      duration: Duration.zero,
      homeIndex: 0,
      builder: (context, child, tabsRouter) {
        final tabsRouter = AutoTabsRouter.of(context);
        final meta = tabsRouter.current.router.topPage?.routeData.meta ?? {};

        return Scaffold(
          body: child,
          bottomNavigationBar: (meta['showBottomNavBar'] as bool? ?? true)
              ? BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,

                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                )
              : null,
          floatingActionButton: context.di.env != .prod
              ? FloatingActionButton(
                  child: const Icon(Icons.bug_report),
                  onPressed: () {
                    unawaited(context.router.push(DebugRoute()));
                  },
                )
              : null,
        );
      },
    );
  }
}

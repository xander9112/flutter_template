import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/_app.dart';

/// Главный экран приложения
@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: [HomeRoute(), ProfileRoute()],
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

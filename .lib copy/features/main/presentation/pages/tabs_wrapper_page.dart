import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

@RoutePage()
class TabsWrapperPage extends StatelessWidget {
  const TabsWrapperPage({super.key});

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
        );
      },
    );
  }
}

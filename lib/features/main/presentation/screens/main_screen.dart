import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/ui_kit/app_box.dart';
import 'package:quiz/features/main/presentation/main_routes.dart';

/// {@template MainScreen}
/// Главный экран приложения
/// {@endtemplate}
@RoutePage()
class MainScreen extends StatelessWidget {
  /// {@macro MainScreen}
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Главный экран приложения'),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                // Переход на экран с деталями
                unawaited(
                  context.router.pushPath(MainRoutes.mainDetailScreenName),
                );
              },
              child: const Text('Переход на экран с деталями'),
            ),
          ],
        ),
      ),
    );
  }
}

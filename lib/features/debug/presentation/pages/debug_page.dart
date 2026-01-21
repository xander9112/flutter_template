import 'dart:async';

import 'package:flutter/material.dart';

/// {@template debug_screen}
/// Экран для отладки приложения
/// {@endtemplate}
class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Screen')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Text('Окружение: ${context.di.appConfig.env.name}'),
            // const SizedBox(height: 22),
            // Text(
            //   'Реализация AppServices: ${context.di.services.secureStorage.nameImpl}',
            // ),
            // const SizedBox(height: 22),
            // ElevatedButton(
            //   onPressed: () async {
            //     await context.di.debugService.openDebugScreen(context);
            //   },
            //   child: const Text('Вызывать Экран отладки'),
            // ),
            // const SizedBox(height: 22),
            // const Text('Экраны для отладки:'),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     unawaited(context.pushNamed(DebugRoutes.iconsScreenName));
            //   },
            //   child: const Text('Экран с иконками'),
            // ),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     unawaited(context.pushNamed(DebugRoutes.themeScreenName));
            //   },
            //   child: const Text('Экран настроек темы'),
            // ),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     unawaited(context.pushNamed(DebugRoutes.tokensScreenName));
            //   },
            //   child: const Text('Экран с токенами'),
            // ),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     unawaited(context.pushNamed(DebugRoutes.uiKitScreenName));
            //   },
            //   child: const Text('Экран UI Kit'),
            // ),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     unawaited(context.pushNamed(DebugRoutes.langScreenName));
            //   },
            //   child: const Text('Экран локализации'),
            // ),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () async {
            //     await context.pushNamed(DebugRoutes.componentsScreenName);
            //   },
            //   child: const Text('Экран компонентов'),
            // ),
            // const SizedBox(height: 22),
            // const Text('Имитирование ошибок:'),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     throw Exception(
            //       'Тестовая ошибка Exception для отладки FlutterError',
            //     );
            //   },
            //   child: const Text('Вызывать ошибку FlutterError'),
            // ),
            // const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _callError();
              },
              child: const Text('Вызывать ошибку PlatformDispatcher'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _callError() async {
    throw Exception('Тестовая ошибка Exception для отладки PlatformDispatcher');
  }
}

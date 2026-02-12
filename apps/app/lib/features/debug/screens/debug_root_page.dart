import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// {@template debug_screen}
/// Экран для отладки приложения
/// {@endtemplate}
@RoutePage()
class DebugRootPage extends StatelessWidget {
  const DebugRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}

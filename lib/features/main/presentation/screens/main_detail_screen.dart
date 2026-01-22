import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// {@template MainDetailScreen}
///  Вложенный экран для главного экрана приложения
/// {@endtemplate}
@RoutePage()
class MainDetailScreen extends StatelessWidget {
  /// {@macro MainDetailScreen}
  const MainDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Detail Screen')),
      body: const Center(child: Text('Вложенный экран')),
    );
  }
}

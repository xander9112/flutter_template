import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/ui_kit/app_box.dart';
import 'package:quiz/features/settings/_settings.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Главный экран приложения'),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                // Переход на экран с деталями

                if (context.read<SettingsCubit>().state.themeMode ==
                    ThemeMode.dark) {
                  context.read<SettingsCubit>().changeTheme(ThemeMode.light);
                } else if (context.read<SettingsCubit>().state.themeMode ==
                    ThemeMode.light) {
                  context.read<SettingsCubit>().changeTheme(ThemeMode.dark);
                } else {
                  context.read<SettingsCubit>().changeTheme(ThemeMode.dark);
                }
              },
              child: const Text('Перейти на темную сторону'),
            ),
          ],
        ),
      ),
    );
  }
}

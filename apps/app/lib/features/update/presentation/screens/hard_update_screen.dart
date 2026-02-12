import 'package:app/app/ui_kit/app_box.dart';
import 'package:app/features/update/domain/state/cubit/update_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Блокирующий экран для обязательного обновления приложения
@RoutePage()
class HardUpdateScreen extends StatelessWidget {
  const HardUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hard Обновление')),
      body: Center(
        child: BlocBuilder<UpdateCubit, UpdateState>(
          builder: (context, updateCubitState) {
            final updateEntity = updateCubitState is UpdateSuccessState
                ? updateCubitState.updateInfo
                : null;
            return Column(
              children: [
                const Text(
                  'Доступна новая версия приложения. Пожалуйста, обновите его.',
                ),
                const HBox(16),
                Text(
                  'Доступная версия: ${updateEntity?.availableVersion ?? ''}',
                ),
                const HBox(8),
                Text('Что нового: ${updateEntity?.whatIsNew ?? ''}'),
                const HBox(8),
                Text('Тип обновления: ${updateEntity?.updateType ?? ''}'),
                const HBox(8),
                Text('URL для обновления: ${updateEntity?.updateUrl ?? ''}'),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/ui_kit/app_box.dart';
import 'package:quiz/features/update/domain/entity/update_entity.dart';

/// {@template soft_update_modal}
/// Модальное окно для уведомления о доступности новой версии приложения.
///
/// Отвечает за:
/// - Отображение информации о новой версии приложения
/// - Предоставление возможности обновления или отложения
/// - Показ описания изменений в новой версии
/// - Мягкое уведомление пользователя без принуждения к обновлению
/// {@endtemplate}
class SoftUpdateModal extends StatelessWidget {
  /// {@macro soft_update_modal}
  const SoftUpdateModal({required this.updateEntity, this.onUpdate, super.key});

  /// Информация об обновлении
  final UpdateEntity updateEntity;

  /// Обратный вызов при нажатии "Обновить"
  final VoidCallback? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок
          Text(
            'Доступна новая версия: ${updateEntity.availableVersion} ',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const HBox(16),

          // Описание изменений
          Text(
            'Что нового:',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const HBox(8),
          Text(
            updateEntity.whatIsNew,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const HBox(24),

          // Кнопки действий
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text('Отложить'),
                ),
              ),
              const WBox(12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                    onUpdate?.call();
                  },
                  child: const Text('Обновить'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Показать модальное окно обновления
  ///
  /// [context] - контекст для отображения модального окна
  /// [updateEntity] - информация об обновлении
  /// [onUpdate] - функция при нажатии "Обновить"
  static Future<void> show(
    BuildContext context, {
    required UpdateEntity updateEntity,
    VoidCallback? onUpdate,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          SoftUpdateModal(updateEntity: updateEntity, onUpdate: onUpdate),
    );
  }
}

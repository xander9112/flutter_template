import 'package:auth/src/_src.dart';
import 'package:core/core.dart';
import 'package:ui_kit/ui_kit.dart';

class SetBiometryUseCase implements UseCaseNoParams<bool> {
  SetBiometryUseCase(this._biometricRepository);

  final IBiometricRepository _biometricRepository;

  @override
  Future<bool> call() async {
    final result = await _biometricRepository.getBiometricModel();

    if (result.status == BiometricStatus.notAvailable) {
      return false;
    }

    if (result.status == BiometricStatus.available) {
      final useBio = await DialogService.showDialog<bool>(
        child: const UiConfirmDialog(
          title: 'SettingsI18n.useBiometricsToLogin',
        ),
      );

      if (useBio ?? false) {
        await _biometricRepository.setUseBiometric(value: true);

        return true;
      } else {
        await _biometricRepository.setUseBiometric(value: false);

        return false;
      }
    }

    return false;
  }
}

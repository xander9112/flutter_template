import 'dart:async';

import 'package:auth/src/_src.dart';
import 'package:dependencies/dependencies.dart';
import 'package:local_auth_android/local_auth_android.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthCubit({
    required IAuthManager<UserEntity> authManager,
    required GetBiometricSupportModel getBiometricSupportModel,
    required CheckLocalAuthUseCase checkLocalAuthUseCase,
    required String localizedReasonParam,
    required List<AuthMessages> authMessagesParam,
  }) : _authManager = authManager,
       _getBiometricSupportModel = getBiometricSupportModel,
       _checkLocalAuthUseCase = checkLocalAuthUseCase,

       super(const LocalAuthInitializing()) {
    localizedReason = localizedReasonParam;
    authMessages = authMessagesParam;
    unawaited(init());
  }

  final IAuthManager<UserEntity> _authManager;

  final GetBiometricSupportModel _getBiometricSupportModel;

  final CheckLocalAuthUseCase _checkLocalAuthUseCase;

  late final List<AuthMessages> authMessages;
  late final String localizedReason;

  Future<void> init() async {
    emit(const LocalAuthInitializing());

    final result = await _checkLocalAuthUseCase();

    switch (result) {
      case LocalAuthResult.locked:
        final biometricSupportModel = await _getBiometricSupportModel();

        emit(LocalAuthEnter(biometricSupportModel: biometricSupportModel));

        biometricAuth();
        return;
      case LocalAuthResult.unlocked:
      case LocalAuthResult.notAvailable:
      case LocalAuthResult.notInitialized:
        emit(const LocalAuthCreate());

        return;
    }
  }

  Future<void> createPin(String pinCode) async {
    if (state is LocalAuthCreate) {
      final localState = state as LocalAuthCreate;

      if (!localState.isConfirm) {
        emit(LocalAuthCreate(tempCode: pinCode));
      } else if (localState.tempCode == pinCode) {
        await _authManager.setPinCode(pinCode);

        final biometricSupportModel = await _getBiometricSupportModel();

        if (biometricSupportModel.status == BiometricStatus.available) {
          emit(const LocalAuthCreate(requestedUseBiometrics: true));

          return;
        }

        unawaited(_authManager.unlock(pinCode: pinCode));
      } else {
        emit(
          LocalAuthCreate(
            error: AuthFailure(
              code: AuthErrors.pinCodeNotConfirmed,
              message: '',
            ),
          ),
        );

        await Future<void>.delayed(const Duration(seconds: 3));

        if (!isClosed) {
          emit(const LocalAuthCreate());
        }
      }
    }
  }

  Future<void> enterPin(String pinCode) async {
    final result = await _authManager.unlock(pinCode: pinCode);

    await result.fold((error) async {
      if (!isClosed) {
        switch (state) {
          case LocalAuthInitializing():
          case LocalAuthCreate():
          case LocalAuthEnter():
            emit(
              LocalAuthEnter(
                error: error,
                biometricSupportModel:
                    (state as LocalAuthEnter).biometricSupportModel,
              ),
            );
        }
      }

      await Future.delayed(
        const Duration(seconds: 3),
        () {
          if (!isClosed) {
            switch (state) {
              case LocalAuthInitializing():
              case LocalAuthCreate():
              case LocalAuthEnter():
                emit(
                  LocalAuthEnter(
                    biometricSupportModel:
                        (state as LocalAuthEnter).biometricSupportModel,
                  ),
                );
            }
          }
        },
      );
    }, (r) {});
  }

  Future<void> resetPinCode() async {
    await _authManager.signOut();
  }

  void biometricAuth() {
    unawaited(
      _authManager.unlock(
        localizedReason: localizedReason,
        authMessages: authMessages,
      ),
    );
  }

  Future<void> setUseBiometric(bool? value) async {
    await _authManager.setUseBiometry(value ?? false);

    biometricAuth();
  }
}

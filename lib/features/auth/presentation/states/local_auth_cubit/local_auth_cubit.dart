import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/auth/_auth.dart';

part 'local_auth_cubit.freezed.dart';
part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthCubit({
    required IAuthManager<UserEntity> authManager,
    required IAuthRepository<TokensDTO, UserEntity> authRepository,
  }) : _authRepository = authRepository,
       _authManager = authManager,
       super(const LocalAuthState());

  final IAuthRepository<TokensDTO, UserEntity> _authRepository;

  final IAuthManager<UserEntity> _authManager;

  Future<void> init() async {
    final hasPinCode = await _authRepository.hasPinCode();

    emit(state.copyWith(hasPinCode: hasPinCode, status: StateStatus.ready));
  }

  Future<void> createPin(String pinCode) async {
    if (!state.isConfirm) {
      emit(state.copyWith(tempCode: pinCode));
    } else if (state.tempCode == pinCode) {
      await _authRepository.setPinCode(pinCode);

      await _authManager.unlock(pinCode);
    } else {
      emit(state.copyWith(error: 'Pin code not confirmed'));

      await Future.delayed(
        const Duration(seconds: 3),
        () => emit(state.copyWith(error: null)),
      );
    }
  }

  Future<void> enterPin(String pinCode) async {
    final result = await _authManager.unlock(pinCode);

    await result.fold((e) async {
      emit(state.copyWith(error: e.message));

      await Future.delayed(
        const Duration(seconds: 3),
        () => emit(state.copyWith(error: null)),
      );
    }, (r) {});
  }

  Future<void> resetPinCode() async {
    await _authManager.signOut();
  }
}

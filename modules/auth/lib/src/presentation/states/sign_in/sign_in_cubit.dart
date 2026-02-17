import 'dart:async';

import 'package:auth/src/_src.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

part 'sign_in_form.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required IAuthManager<UserEntity> authManager,
  }) : _authManager = authManager,
       super(SignInInitializing(SignInForm())) {
    unawaited(init());
  }

  final IAuthManager<UserEntity> _authManager;

  Future<void> init() async {
    await state.form.init();

    emit(SignInInitial(state.form));
  }

  Future<void> signIn() async {
    if (state.form.isValid) {
      emit(SignInLoading(state.form));

      final result = await _authManager.signIn(
        state.form.value[SignInForm.loginField].toString(),
        state.form.value[SignInForm.passwordField].toString(),
      );

      result.fold(
        (error) {
          if (error.fields.isNotEmpty) {
            for (final element in error.fields) {
              state.form.invalidate(element.field, {
                element.code: element.message,
              });
            }
          }

          emit(SignInError(state.form, error));
        },
        (response) {
          emit(SignInSuccess(state.form));
        },
      );
    }
  }
}

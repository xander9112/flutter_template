part of 'local_auth_cubit.dart';

@freezed
sealed class LocalAuthState with _$LocalAuthState {
  const factory LocalAuthState({
    @Default(StateStatus.notReady) StateStatus status,
    @Default(false) bool hasPinCode,

    String? error,

    String? tempCode,
  }) = _Initial;

  const LocalAuthState._();

  bool get isConfirm => tempCode != null;
}

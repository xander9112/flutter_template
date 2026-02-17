part of 'local_auth_cubit.dart';

@immutable
sealed class LocalAuthState with EquatableMixin {
  const LocalAuthState();

  @mustCallSuper
  @override
  List<Object?> get props => [];
}

class LocalAuthInitializing extends LocalAuthState {
  const LocalAuthInitializing();
}

class LocalAuthCreate extends LocalAuthState {
  const LocalAuthCreate({
    this.tempCode,
    this.error,
    this.requestedUseBiometrics = false,
  });

  final String? tempCode;
  final AuthFailure? error;

  final bool requestedUseBiometrics;

  bool get isConfirm => tempCode != null;

  @override
  List<Object?> get props => [...super.props, tempCode, error];
}

class LocalAuthEnter extends LocalAuthState {
  const LocalAuthEnter({required this.biometricSupportModel, this.error});

  final BiometricSupportModel biometricSupportModel;

  final AuthFailure? error;

  @override
  List<Object?> get props => [...super.props, error];
}

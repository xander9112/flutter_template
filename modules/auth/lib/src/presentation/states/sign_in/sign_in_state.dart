part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState with EquatableMixin {
  const SignInState(this.form);

  final SignInForm form;

  bool get isLoading => this is SignInLoading;

  @mustCallSuper
  @override
  List<Object?> get props => [];
}

class SignInInitializing extends SignInState {
  const SignInInitializing(super.form);
}

class SignInInitial extends SignInState {
  const SignInInitial(super.form);
}

class SignInLoading extends SignInState {
  const SignInLoading(super.form);
}

class SignInSuccess extends SignInState {
  const SignInSuccess(super.form);
}

class SignInError extends SignInState {
  const SignInError(super.form, this.error);

  final AuthFailure error;

  @override
  List<Object?> get props => [...super.props, error];
}

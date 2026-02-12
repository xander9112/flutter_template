part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {
  const SignInState(this.form);

  final SignInForm form;

  bool get isLoading => this is SignInLoading;

  bool get inSubmitting => this is SignInSubmitting;

  bool get isError => this is SignInError;
}

class SignInLoading extends SignInState {
  const SignInLoading(super.form);
}

class SignInInitial extends SignInState {
  const SignInInitial(super.form, {required this.strs});

  final List<String> strs;
}

class SignInSubmitting extends SignInState {
  const SignInSubmitting(super.form);
}

class SignInSuccess extends SignInState {
  const SignInSuccess(super.form);
}

class SignInError extends SignInState {
  const SignInError(super.form, this.error);

  final Failure error;
}

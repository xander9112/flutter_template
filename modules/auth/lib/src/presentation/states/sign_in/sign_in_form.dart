part of 'sign_in_cubit.dart';

class SignInForm extends FormWorker<void> {
  static const String loginField = 'login';

  static const String passwordField = 'password';

  late final FormControl<String> loginControl;

  late final FormControl<String> passwordControl;

  @override
  Future<FormGroup> init([void initialValue]) async {
    loginControl = FormControl<String>(validators: [Validators.required]);

    passwordControl = FormControl<String>(validators: [Validators.required]);

    return form = FormGroup({
      SignInForm.loginField: loginControl,
      SignInForm.passwordField: passwordControl,
    });
  }
}

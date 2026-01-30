import 'package:quiz/features/debug/_debug.dart';

class AuthFailure extends Failure {
  AuthFailure({required super.code, required super.message});

  @override
  String getLocalizedString() {
    return message;
  }
}

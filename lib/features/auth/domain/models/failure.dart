import 'package:quiz/features/debug/_debug.dart';

class AuthFailure implements Failure {
  @override
  final String error;

  AuthFailure({required this.error});
}

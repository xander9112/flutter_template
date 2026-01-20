import 'package:quiz/core/failure.dart';

class AuthFailure implements Failure {
  @override
  final String error;

  AuthFailure({required this.error});
}

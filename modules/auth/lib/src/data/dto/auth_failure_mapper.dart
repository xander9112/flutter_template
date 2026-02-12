import 'package:auth/src/_src.dart';

sealed class AuthFailureMapper {
  static AuthFailure fromJson(Map<String, dynamic> json) {
    return AuthFailure(
      code: json['code'].toString(),
      message: json['message'].toString(),
    );
  }
}

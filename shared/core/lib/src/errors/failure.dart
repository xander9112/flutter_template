import 'package:core/core.dart';

class Failure implements Exception {
  Failure({
    required this.code,
    required this.message,
    this.details = const {},
    this.fields = const [],
  });

  final String code;
  final String message;

  final Map<String, dynamic> details;
  final List<FieldError> fields;

  @override
  String toString() => message.isNotEmpty ? message : code;
}

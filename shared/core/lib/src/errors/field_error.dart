// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FieldError {
  final String field;
  final String code;
  final String message;

  FieldError({required this.field, required this.code, required this.message});

  FieldError copyWith({String? field, String? code, String? message}) {
    return FieldError(
      field: field ?? this.field,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'field': field, 'code': code, 'message': message};
  }

  factory FieldError.fromMap(Map<String, dynamic> map) {
    return FieldError(
      field: map['field'] as String,
      code: map['code'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FieldError.fromJson(String source) =>
      FieldError.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FieldError(field: $field, code: $code, message: $message)';

  @override
  bool operator ==(covariant FieldError other) {
    if (identical(this, other)) return true;

    return other.field == field &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => field.hashCode ^ code.hashCode ^ message.hashCode;
}

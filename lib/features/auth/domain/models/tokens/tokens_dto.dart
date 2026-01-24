import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_dto.freezed.dart';
part 'tokens_dto.g.dart';

@freezed
sealed class TokensDTO with _$TokensDTO {
  const factory TokensDTO({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _TokensDTO;

  factory TokensDTO.fromJson(Object? json) =>
      _$TokensDTOFromJson(json! as Map<String, dynamic>);

  const TokensDTO._();

  @override
  Map<String, dynamic> toJson();
}

import 'package:app/features/profile/domain/repository/i_profile_repository.dart';
import 'package:core/core.dart';

/// {@template ProfileRepository}
///  Реализация репозитория профиля пользователя
/// {@endtemplate}
final class ProfileRepository implements IProfileRepository {
  ProfileRepository({required this.httpClient});

  /// Экземпляр HTTP клиента для взаимодействия с сервером
  final AppHttpClient httpClient;

  @override
  String get name => 'ProfileRepository';

  @override
  Future<String> fetchUserProfile(String id) async {
    return Future<String>.delayed(
      const Duration(seconds: 1),
      () => 'Yura Petrov',
    );
  }
}

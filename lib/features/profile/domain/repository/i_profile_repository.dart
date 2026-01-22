import 'package:quiz/di/di_base_repo.dart';

/// {@template IProfileRepository}
///
/// {@endtemplate}
abstract interface class IProfileRepository with DiBaseRepo {
  Future<String> fetchUserProfile(String id);
}

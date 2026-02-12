import 'package:core/core.dart';

/// {@template IProfileRepository}
///
/// {@endtemplate}
abstract interface class IProfileRepository with DiBaseRepo {
  Future<String> fetchUserProfile(String id);
}

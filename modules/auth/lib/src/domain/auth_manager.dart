import 'dart:async';

import 'package:app/features/debug/_debug.dart';
import 'package:auth/src/_src.dart';
import 'package:dartz/dartz.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:rxdart/subjects.dart';

class AuthManager extends IAuthManager<UserEntity> {
  AuthManager({
    required IDebugService debugService,
    required IAuthRepository<TokensDTO, UserEntity> authRepository,
    required IBiometricRepository biometricRepository,
  }) : _debugService = debugService,
       _authRepository = authRepository,
       _biometricRepository = biometricRepository;

  final IDebugService _debugService;

  final IAuthRepository<TokensDTO, UserEntity> _authRepository;

  final IBiometricRepository _biometricRepository;

  @override
  BehaviorSubject<UserEntity> user = BehaviorSubject.seeded(
    const UserEntity.notAuthenticated(),
  );

  final BehaviorSubject<AuthStatus> _authStatus = BehaviorSubject.seeded(
    AuthStatus.unauthenticated,
  );

  final BehaviorSubject<LockStatus> _lockStatus = BehaviorSubject.seeded(
    LockStatus.locked,
  );

  final BehaviorSubject<OnboardingStatus> _onboardingStatus =
      BehaviorSubject.seeded(OnboardingStatus.notCompleted);

  bool _locked = true;

  bool get locked => settings.useLocalAuth && _locked;

  set locked(bool value) {
    _locked = value;
  }

  DateTime? _blockedUntil;

  Timer? _unblockTimer;

  @override
  int get remainingSeconds {
    if (_blockedUntil == null) return 0;

    final diff = _blockedUntil!.difference(DateTime.now()).inSeconds;
    return diff > 0 ? diff : 0;
  }

  @override
  BehaviorSubject<AuthStatus> get authStatus => _authStatus;

  @override
  BehaviorSubject<LockStatus> get lockStatus => _lockStatus;

  @override
  BehaviorSubject<OnboardingStatus> get onboardingStatus => _onboardingStatus;

  @override
  Future<bool> get hasPinCode => _authRepository.hasPinCode();

  @override
  AuthSettings settings = const AuthSettings(
    useBiometric: false,
    useLocalAuth: false,
  );

  @override
  Future<void> init() async {
    await _checkUserBlocking();

    await _initSettings();

    await _checkOnboarding();

    final userResult = await _authRepository.getCurrentUser();

    await userResult.fold((error) {}, (response) async {
      user.add(response);

      if (settings.useLocalAuth) {
        final hasPinCode = await _authRepository.hasPinCode();

        if (!hasPinCode) {
          await signOut();
        }
      }
    });

    _checkStatus();
  }

  @override
  Future<void> finishOnboarding() async {
    await _authRepository.finishOnboarding();

    await _checkOnboarding();

    notifyListeners();
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signIn(
    String login,
    String password,
  ) async {
    final result = await _authRepository.signIn(login, password);

    return result.fold(
      (error) {
        _debugService.logError(error.message);

        return Left(error);
      },
      (response) async {
        final currentUser = await _authRepository.getCurrentUser();

        return currentUser.fold(Left.new, (r) {
          user.add(r);

          _checkStatus();

          return Right(r);
        });
      },
    );
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signUp(
    String login,
    String password,
  ) async {
    final result = await _authRepository.signUp(login, password);

    return result.fold(
      (error) {
        _debugService.logError(error.message);

        return Left(error);
      },
      (response) async {
        final currentUser = await _authRepository.getCurrentUser();

        return currentUser.fold(Left.new, (r) {
          user.add(r);

          _checkStatus();

          return Right(r);
        });
      },
    );
  }

  @override
  Future<void> signOut() async {
    await _authRepository.signOut();

    user.add(const UserEntity.notAuthenticated());

    await _checkOnboarding();

    await _authRepository.unBlocUser();

    locked = true;

    _checkStatus();
  }

  @override
  Future<void> block() async {}

  @override
  Future<void> unBlock() async {}

  @override
  Future<void> lock() async {
    locked = true;

    _checkStatus();
  }

  @override
  Future<void> setPinCode(String value) async {
    return _authRepository.setPinCode(value);
  }

  @override
  Future<Either<AuthFailure, void>> unlock({
    String? localizedReason,
    String? pinCode,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  }) async {
    if (pinCode == null) {
      if (!settings.useBiometric) {
        return const Right(null);
      }

      return _unlockByBiometry(
        localizedReason: localizedReason ?? 'Auth req',
        authMessages: authMessages,
      );
    }

    try {
      locked = !(await _authRepository.comparePinCode(pinCode));

      _checkStatus();

      return const Right(null);
    } on AuthFailure catch (error) {
      if (error.code == AuthErrors.pinCodeAttemptsEnded) {
        await signOut();
      }

      return Left(error);
    }
  }

  Future<Either<AuthFailure, void>> _unlockByBiometry({
    required String localizedReason,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  }) async {
    final biometricModel = await _biometricRepository.getBiometricModel();

    if (biometricModel.status != BiometricStatus.available ||
        !(biometricModel.useBiometric ?? false)) {
      return const Right(null);
    }

    final result = await _biometricRepository.onInitBiometric(
      localizedReason: localizedReason,
      authMessages: authMessages,
    );

    locked = !(result ?? false);

    _checkStatus();

    return const Right(null);
  }

  @override
  Future<BiometricSupportModel> getBiometricSupportModel() async {
    if (settings.useBiometric) {
      return const BiometricSupportModel(useBiometric: false);
    }

    return _biometricRepository.getBiometricModel();
  }

  @override
  Future<void> setUseBiometry(bool value) async {
    await _biometricRepository.setUseBiometric(value: value);
  }

  void _checkStatus() {
    if (remainingSeconds > 0) {
      _authStatus.add(AuthStatus.blocked);

      notifyListeners();

      return;
    }

    _authStatus.add(
      user.value.isNotAuthenticated
          ? AuthStatus.unauthenticated
          : AuthStatus.authenticated,
    );

    _lockStatus.add(locked ? LockStatus.locked : LockStatus.unlocked);

    notifyListeners();
  }

  Future<void> _initSettings() async {
    final useBiometric = await _authRepository.useBiometric;

    settings = AuthSettings(
      useBiometric: useBiometric ?? settings.useBiometric,
      useLocalAuth: await _authRepository.useLocalAuth(),
    );
  }

  Future<void> _checkOnboarding() async {
    final watched = await _authRepository.watchedOnboarding();

    onboardingStatus.add(
      watched ? OnboardingStatus.completed : OnboardingStatus.notCompleted,
    );
  }

  Future<void> _checkUserBlocking() async {
    _blockedUntil = await _authRepository.getBlockTime();

    if (_blockedUntil != null) {
      if (_blockedUntil!.difference(DateTime.now()).inSeconds > 0) {
        _scheduleUnblock(_blockedUntil!);
      }
    }
  }

  void _scheduleUnblock(DateTime blockedUntil) {
    _unblockTimer?.cancel();
    _blockedUntil = blockedUntil;

    _unblockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().isAfter(blockedUntil)) {
        timer.cancel();
        _checkStatus();
      } else {
        notifyListeners(); // ⬅️ обновляем UI
      }
    });
  }
}

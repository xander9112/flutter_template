import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/_debug.dart';
import 'package:rxdart/subjects.dart';

class AuthManager extends IAuthManager<UserEntity> {
  AuthManager({
    required IDebugService debugService,
    required this.authRepository,
  }) : _debugService = debugService;

  final IDebugService _debugService;

  final IAuthRepository<TokensDTO, UserEntity> authRepository;

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
  AuthSettings settings = const AuthSettings(
    useBiometric: true,
    useLocalAuth: true,
  );

  @override
  Future<void> init() async {
    // await authRepository.blockUser(DateTime.now().add(Duration(seconds: 10)));

    await _checkUserBlocking();

    await _initSettings();

    await _checkOnboarding();

    final userResult = await authRepository.getCurrentUser();

    userResult.fold((error) {}, (r) {
      print(r);
      user.add(r);
    });

    _checkStatus();
  }

  @override
  Future<void> finishOnboarding() async {
    await authRepository.finishOnboarding();

    await _checkOnboarding();

    notifyListeners();
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
    String login,
    String password,
  ) async {
    final result = await authRepository.signIn(login, password);

    return result.fold(
      (error) {
        _debugService.logError(error.message);

        return Left(error);
      },
      (response) async {
        final currentUser = await authRepository.getCurrentUser();

        return currentUser.fold(Left.new, (r) {
          user.add(r);

          _checkStatus();

          return Right(r);
        });
      },
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
    String login,
    String password,
  ) async {
    final result = await authRepository.signUp(login, password);

    return result.fold(
      (error) {
        _debugService.logError(error.message);

        return Left(error);
      },
      (response) async {
        final currentUser = await authRepository.getCurrentUser();

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
    await authRepository.signOut();

    user.add(const UserEntity.notAuthenticated());

    await _checkOnboarding();

    await authRepository.unBlocUser();

    _locked = true;

    _checkStatus();
  }

  @override
  Future<void> block() async {}

  @override
  Future<void> unBlock() async {}

  @override
  Future<void> lock() async {
    _locked = true;

    _checkStatus();
  }

  @override
  Future<Either<Failure, void>> unlock(String pinCode) async {
    _locked = !(await authRepository.comparePinCode(pinCode));

    if (_locked) {
      return Left(AuthFailure(code: 0, message: 'Wrong pinCode'));
    }

    _checkStatus();

    return const Right(null);
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

    _lockStatus.add(_locked ? LockStatus.locked : LockStatus.unlocked);

    notifyListeners();
  }

  Future<void> _initSettings() async {
    final useBiometric = await authRepository.useBiometric;

    settings = AuthSettings(
      useBiometric: useBiometric ?? settings.useBiometric,
      useLocalAuth: await authRepository.useLocalAuth(),
    );
  }

  Future<void> _checkOnboarding() async {
    final watched = await authRepository.watchedOnboarding();

    onboardingStatus.add(
      watched ? OnboardingStatus.completed : OnboardingStatus.notCompleted,
    );
  }

  Future<void> _checkUserBlocking() async {
    _blockedUntil = await authRepository.getBlockTime();

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
  // final IDebugService _debugService;

  // final bool isMustLogin = true;
  // final bool isMustVerify = true;

  // static const _kOnboardingDone = 'onboarding_done';
  // static const _kHasSession = 'has_session';
  // static const _kHasPin = 'has_pin';

  // final BehaviorSubject<AuthStage> _stage = BehaviorSubject.seeded(
  //   AuthStage.unauthenticated,
  // );

  // BehaviorSubject<AuthStage> get stage => _stage;

  // late SharedPreferences _prefs;

  // List<PageRouteInfo>? _pendingRoutes;

  // List<PageRouteInfo>? get pendingRoutes => _pendingRoutes;

  // bool get isSignIn => stage.value == AuthStage.authenticated;

  // void savePending(List<RouteMatch> matches) {
  //   if (matches.isEmpty) return;
  //   _pendingRoutes = matches.map((e) => e.toPageRouteInfo()).toList();
  // }

  // void setPendingRoutes(List<PageRouteInfo> routes) {
  //   _pendingRoutes = routes;
  // }

  // List<PageRouteInfo> consumePendingRoutes() {
  //   final routes = _pendingRoutes;
  //   _pendingRoutes = null;
  //   return routes ?? [];
  // }

  // // stage setters
  // void setStage(AuthStage value) {
  //   if (_stage.value == value) return;
  //   _stage.add(value);
  //   notifyListeners();
  // }

  // Future<void> init() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _debugService.logDebug('Auth init');
  //   await _prefs.remove(_kOnboardingDone);

  //   await Future.delayed(Duration(seconds: 2));

  //   _checkStatus();
  // }

  // Future<void> _checkStatus() async {
  //   final hasSession = _prefs.getBool(_kHasSession) ?? false;
  //   final onboardingDone = _prefs.getBool(_kOnboardingDone) ?? false;
  //   final hasPin = isMustVerify ? _prefs.getBool(_kHasPin) ?? true : false;

  //   if (!hasSession) {
  //     _stage.add(AuthStage.unauthenticated);
  //   } else if (hasPin) {
  //     _stage.add(AuthStage.locked);
  //   } else if (!onboardingDone) {
  //     _stage.add(AuthStage.onboarding);
  //   } else {
  //     _stage.add(AuthStage.authenticated);
  //   }

  //   notifyListeners();
  // }

  // // ---------- FLOWS ----------

  // Future<void> completeOnboarding() async {
  //   await _prefs.setBool(_kOnboardingDone, true);
  //   _checkStatus();
  // }

  // Future<void> signIn() async {
  //   await _prefs.setBool(_kHasSession, true);
  //   if (isMustVerify) {
  //     _stage.add(AuthStage.locked);
  //   } else {
  //     _stage.add(AuthStage.authenticated);
  //   }
  //   notifyListeners();
  // }

  // Future<void> signUp() async {
  //   await signIn();
  // }

  // Future<void> unlock() async {
  //   _stage.add(AuthStage.authenticated);

  //   notifyListeners();
  // }

  // Future<void> lock() async {
  //   _stage.add(AuthStage.locked);
  //   notifyListeners();
  // }

  // Future<void> signOut() async {
  //   await _prefs.remove(_kHasSession);
  //   _checkStatus();
  // }
}

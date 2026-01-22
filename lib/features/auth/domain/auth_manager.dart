import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/features/debug/_debug.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStage {
  unauthenticated, // login / register
  onboarding, // onboarding (1 раз)
  locked, // pin / biometrics
  authenticated, // main
}

class AuthManager extends ChangeNotifier {
  AuthManager({required IDebugService debugService})
    : _debugService = debugService;

  final IDebugService _debugService;

  final bool isMustLogin = true;
  final bool isMustVerify = true;

  static const _kOnboardingDone = 'onboarding_done';
  static const _kHasSession = 'has_session';
  static const _kHasPin = 'has_pin';

  final BehaviorSubject<AuthStage> _stage = BehaviorSubject.seeded(
    AuthStage.unauthenticated,
  );

  BehaviorSubject<AuthStage> get stage => _stage;

  late SharedPreferences _prefs;

  List<PageRouteInfo>? _pendingRoutes;

  List<PageRouteInfo>? get pendingRoutes => _pendingRoutes;

  bool get isSignIn => stage.value == AuthStage.authenticated;

  void savePending(List<RouteMatch> matches) {
    if (matches.isEmpty) return;
    _pendingRoutes = matches.map((e) => e.toPageRouteInfo()).toList();
  }

  void setPendingRoutes(List<PageRouteInfo> routes) {
    _pendingRoutes = routes;
  }

  List<PageRouteInfo> consumePendingRoutes() {
    final routes = _pendingRoutes;
    _pendingRoutes = null;
    return routes ?? [];
  }

  // stage setters
  void setStage(AuthStage value) {
    if (_stage.value == value) return;
    _stage.add(value);
    notifyListeners();
  }

  Future<void> init() async {
    // _logger.info('AUTH INIT');

    _prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    final hasSession = _prefs.getBool(_kHasSession) ?? false;
    final onboardingDone = _prefs.getBool(_kOnboardingDone) ?? false;
    final hasPin = isMustVerify ? _prefs.getBool(_kHasPin) ?? true : false;

    if (!onboardingDone) {
      _stage.add(AuthStage.onboarding);
    } else if (!hasSession) {
      _stage.add(AuthStage.unauthenticated);
    } else if (hasPin) {
      _stage.add(AuthStage.locked);
    } else {
      _stage.add(AuthStage.authenticated);
    }

    // _logger.info('AUTH READY');

    notifyListeners();
  }

  // ---------- FLOWS ----------

  Future<void> completeOnboarding() async {
    await _prefs.setBool(_kOnboardingDone, true);
    _stage.add(AuthStage.unauthenticated);
    notifyListeners();
  }

  Future<void> signIn() async {
    await _prefs.setBool(_kHasSession, true);
    if (isMustVerify) {
      _stage.add(AuthStage.locked);
    } else {
      _stage.add(AuthStage.authenticated);
    }
    notifyListeners();
  }

  Future<void> signUp() async {
    await signIn();
  }

  Future<void> unlock() async {
    _stage.add(AuthStage.authenticated);

    notifyListeners();
  }

  Future<void> lock() async {
    _stage.add(AuthStage.locked);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _prefs.remove(_kHasSession);
    _stage.add(AuthStage.unauthenticated);
    notifyListeners();
  }
}

import 'dart:async';

import 'package:auth/src/_src.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:rxdart/subjects.dart';

abstract class IAuthManager<U> extends ChangeNotifier {
  BehaviorSubject<U> get user;

  BehaviorSubject<AuthStatus> get authStatus;

  BehaviorSubject<LockStatus> get lockStatus;

  BehaviorSubject<OnboardingStatus> get onboardingStatus;

  int get remainingSeconds;

  Future<bool> get hasPinCode;

  AuthSettings get settings;

  Future<void> init();

  Future<void> finishOnboarding();

  Future<Either<AuthFailure, U>> signIn(String login, String password);

  Future<Either<AuthFailure, U>> signUp(String login, String password);

  Future<void> signOut();

  Future<void> lock();

  Future<void> setPinCode(String value);

  Future<Either<AuthFailure, void>> unlock({
    String? localizedReason,
    String? pinCode,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  });

  Future<void> setUseBiometry(bool value);

  Future<void> block();

  Future<void> unBlock();

  Future<BiometricSupportModel> getBiometricSupportModel();
}

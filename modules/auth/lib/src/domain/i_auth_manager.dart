import 'dart:async';

import 'package:auth/src/_src.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

abstract class IAuthManager<U> extends ChangeNotifier {
  BehaviorSubject<U> get user;

  BehaviorSubject<AuthStatus> get authStatus;

  BehaviorSubject<LockStatus> get lockStatus;

  BehaviorSubject<OnboardingStatus> get onboardingStatus;

  int get remainingSeconds;

  AuthSettings get settings;

  Future<void> init();

  Future<void> finishOnboarding();

  Future<Either<Failure, U>> signIn(String login, String password);

  Future<Either<Failure, U>> signUp(String login, String password);

  Future<void> signOut();

  Future<void> lock();

  Future<Either<Failure, void>> unlock(String pinCode);

  Future<void> block();

  Future<void> unBlock();
}

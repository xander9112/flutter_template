enum AuthStatus {
  unauthenticated,
  authenticated,
  blocked;

  bool get isUnauthenticated => this == unauthenticated;

  bool get isAuthenticated => this == authenticated;

  bool get isBlocked => this == blocked;
}

enum LockStatus {
  unlocked,
  locked;

  bool get isLocked => this == locked;

  bool get isUnLocked => this == unlocked;
}

enum OnboardingStatus {
  notCompleted,
  completed;

  bool get isCompleted => this == completed;

  bool get isNotCompleted => this == notCompleted;
}

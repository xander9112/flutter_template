// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:quiz/features/auth/presentation/pages/auth_page.dart' as _i1;
import 'package:quiz/features/auth/presentation/pages/no_access_page.dart'
    as _i5;
import 'package:quiz/features/auth/presentation/pages/onboarding_page.dart'
    as _i6;
import 'package:quiz/features/auth/presentation/pages/sign_in_page.dart'
    as _i12;
import 'package:quiz/features/auth/presentation/pages/sign_up_page.dart'
    as _i13;
import 'package:quiz/features/auth/presentation/pages/verify_page.dart' as _i15;
import 'package:quiz/features/home/presentation/pages/home_admin_page.dart'
    as _i2;
import 'package:quiz/features/home/presentation/pages/home_page.dart' as _i3;
import 'package:quiz/features/main/presentation/pages/main_flow.dart' as _i4;
import 'package:quiz/features/main/presentation/pages/tabs_wrapper_page.dart'
    as _i14;
import 'package:quiz/features/profile/presentation/pages/profile_data_page.dart'
    as _i7;
import 'package:quiz/features/profile/presentation/pages/profile_data_root_page.dart'
    as _i8;
import 'package:quiz/features/profile/presentation/pages/profile_info_page.dart'
    as _i9;
import 'package:quiz/features/profile/presentation/pages/profile_page.dart'
    as _i10;
import 'package:quiz/features/settings/presentation/pages/settings_page.dart'
    as _i11;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute({List<_i16.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.HomeAdminPage]
class HomeAdminRoute extends _i16.PageRouteInfo<void> {
  const HomeAdminRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeAdminRoute.name, initialChildren: children);

  static const String name = 'HomeAdminRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeAdminPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.MainFlow]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return _i16.WrappedRoute(child: const _i4.MainFlow());
    },
  );
}

/// generated route for
/// [_i5.NoAccessPage]
class NoAccessRoute extends _i16.PageRouteInfo<void> {
  const NoAccessRoute({List<_i16.PageRouteInfo>? children})
    : super(NoAccessRoute.name, initialChildren: children);

  static const String name = 'NoAccessRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.NoAccessPage();
    },
  );
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i16.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i17.Key? key,
    _i17.VoidCallback? onResult,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i6.OnboardingPage(key: args.key, onResult: args.onResult);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, this.onResult});

  final _i17.Key? key;

  final _i17.VoidCallback? onResult;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingRouteArgs) return false;
    return key == other.key && onResult == other.onResult;
  }

  @override
  int get hashCode => key.hashCode ^ onResult.hashCode;
}

/// generated route for
/// [_i7.ProfileDataPage]
class ProfileDataRoute extends _i16.PageRouteInfo<void> {
  const ProfileDataRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileDataRoute.name, initialChildren: children);

  static const String name = 'ProfileDataRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileDataPage();
    },
  );
}

/// generated route for
/// [_i8.ProfileDataRootPage]
class ProfileDataRootRoute extends _i16.PageRouteInfo<void> {
  const ProfileDataRootRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileDataRootRoute.name, initialChildren: children);

  static const String name = 'ProfileDataRootRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileDataRootPage();
    },
  );
}

/// generated route for
/// [_i9.ProfileInfoPage]
class ProfileInfoRoute extends _i16.PageRouteInfo<void> {
  const ProfileInfoRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileInfoRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileInfoPage();
    },
  );
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i10.ProfileRootPage]
class ProfileRootRoute extends _i16.PageRouteInfo<void> {
  const ProfileRootRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRootRoute.name, initialChildren: children);

  static const String name = 'ProfileRootRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileRootPage();
    },
  );
}

/// generated route for
/// [_i11.SettingsPage]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsPage();
    },
  );
}

/// generated route for
/// [_i12.SignInPage]
class SignInRoute extends _i16.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i17.Key? key,
    _i17.VoidCallback? onResult,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return _i12.SignInPage(key: args.key, onResult: args.onResult);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, this.onResult});

  final _i17.Key? key;

  final _i17.VoidCallback? onResult;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return key == other.key && onResult == other.onResult;
  }

  @override
  int get hashCode => key.hashCode ^ onResult.hashCode;
}

/// generated route for
/// [_i13.SignUpPage]
class SignUpRoute extends _i16.PageRouteInfo<void> {
  const SignUpRoute({List<_i16.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignUpPage();
    },
  );
}

/// generated route for
/// [_i14.TabsWrapperPage]
class TabsWrapperRoute extends _i16.PageRouteInfo<void> {
  const TabsWrapperRoute({List<_i16.PageRouteInfo>? children})
    : super(TabsWrapperRoute.name, initialChildren: children);

  static const String name = 'TabsWrapperRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.TabsWrapperPage();
    },
  );
}

/// generated route for
/// [_i15.VerifyPage]
class VerifyRoute extends _i16.PageRouteInfo<VerifyRouteArgs> {
  VerifyRoute({
    _i17.Key? key,
    _i17.VoidCallback? onResult,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         VerifyRoute.name,
         args: VerifyRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'VerifyRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyRouteArgs>(
        orElse: () => const VerifyRouteArgs(),
      );
      return _i15.VerifyPage(key: args.key, onResult: args.onResult);
    },
  );
}

class VerifyRouteArgs {
  const VerifyRouteArgs({this.key, this.onResult});

  final _i17.Key? key;

  final _i17.VoidCallback? onResult;

  @override
  String toString() {
    return 'VerifyRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerifyRouteArgs) return false;
    return key == other.key && onResult == other.onResult;
  }

  @override
  int get hashCode => key.hashCode ^ onResult.hashCode;
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:quiz/features/auth/presentation/pages/auth_page.dart' as _i1;
import 'package:quiz/features/auth/presentation/pages/no_access_page.dart'
    as _i9;
import 'package:quiz/features/auth/presentation/pages/onboarding_page.dart'
    as _i10;
import 'package:quiz/features/auth/presentation/pages/sign_in_page.dart'
    as _i14;
import 'package:quiz/features/auth/presentation/pages/sign_up_page.dart'
    as _i15;
import 'package:quiz/features/auth/presentation/pages/verify_page.dart' as _i19;
import 'package:quiz/features/debug/screens/components_screen.dart' as _i2;
import 'package:quiz/features/debug/screens/debug_screen.dart' as _i3;
import 'package:quiz/features/debug/screens/icons_screen.dart' as _i5;
import 'package:quiz/features/debug/screens/lang_screen.dart' as _i6;
import 'package:quiz/features/debug/screens/theme_screen.dart' as _i16;
import 'package:quiz/features/debug/screens/tokens_screen.dart' as _i17;
import 'package:quiz/features/debug/screens/ui_kit_screen.dart' as _i18;
import 'package:quiz/features/main/presentation/screens/main_detail_screen.dart'
    as _i7;
import 'package:quiz/features/main/presentation/screens/main_screen.dart'
    as _i8;
import 'package:quiz/features/profile/presentation/screens/profile_screen.dart'
    as _i11;
import 'package:quiz/features/root/root_screen.dart' as _i12;
import 'package:quiz/features/settings/presentation/pages/settings_page.dart'
    as _i13;
import 'package:quiz/features/update/presentation/screens/hard_update_screen.dart'
    as _i4;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i20.PageRouteInfo<void> {
  const AuthRoute({List<_i20.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.ComponentsScreen]
class ComponentsRoute extends _i20.PageRouteInfo<void> {
  const ComponentsRoute({List<_i20.PageRouteInfo>? children})
    : super(ComponentsRoute.name, initialChildren: children);

  static const String name = 'ComponentsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i2.ComponentsScreen();
    },
  );
}

/// generated route for
/// [_i3.DebugScreen]
class DebugRoute extends _i20.PageRouteInfo<void> {
  const DebugRoute({List<_i20.PageRouteInfo>? children})
    : super(DebugRoute.name, initialChildren: children);

  static const String name = 'DebugRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i3.DebugScreen();
    },
  );
}

/// generated route for
/// [_i4.HardUpdateScreen]
class HardUpdateRoute extends _i20.PageRouteInfo<void> {
  const HardUpdateRoute({List<_i20.PageRouteInfo>? children})
    : super(HardUpdateRoute.name, initialChildren: children);

  static const String name = 'HardUpdateRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i4.HardUpdateScreen();
    },
  );
}

/// generated route for
/// [_i5.IconsScreen]
class IconsRoute extends _i20.PageRouteInfo<void> {
  const IconsRoute({List<_i20.PageRouteInfo>? children})
    : super(IconsRoute.name, initialChildren: children);

  static const String name = 'IconsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i5.IconsScreen();
    },
  );
}

/// generated route for
/// [_i6.LangScreen]
class LangRoute extends _i20.PageRouteInfo<void> {
  const LangRoute({List<_i20.PageRouteInfo>? children})
    : super(LangRoute.name, initialChildren: children);

  static const String name = 'LangRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i6.LangScreen();
    },
  );
}

/// generated route for
/// [_i7.MainDetailScreen]
class MainDetailRoute extends _i20.PageRouteInfo<void> {
  const MainDetailRoute({List<_i20.PageRouteInfo>? children})
    : super(MainDetailRoute.name, initialChildren: children);

  static const String name = 'MainDetailRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainDetailScreen();
    },
  );
}

/// generated route for
/// [_i8.MainScreen]
class MainRoute extends _i20.PageRouteInfo<void> {
  const MainRoute({List<_i20.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i8.MainScreen();
    },
  );
}

/// generated route for
/// [_i9.NoAccessPage]
class NoAccessRoute extends _i20.PageRouteInfo<void> {
  const NoAccessRoute({List<_i20.PageRouteInfo>? children})
    : super(NoAccessRoute.name, initialChildren: children);

  static const String name = 'NoAccessRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i9.NoAccessPage();
    },
  );
}

/// generated route for
/// [_i10.OnboardingPage]
class OnboardingRoute extends _i20.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i21.Key? key,
    _i21.VoidCallback? onResult,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         OnboardingRoute.name,
         args: OnboardingRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'OnboardingRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>(
        orElse: () => const OnboardingRouteArgs(),
      );
      return _i10.OnboardingPage(key: args.key, onResult: args.onResult);
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key, this.onResult});

  final _i21.Key? key;

  final _i21.VoidCallback? onResult;

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
/// [_i11.ProfileScreen]
class ProfileRoute extends _i20.PageRouteInfo<void> {
  const ProfileRoute({List<_i20.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i12.RootScreen]
class RootRoute extends _i20.PageRouteInfo<void> {
  const RootRoute({List<_i20.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i12.RootScreen();
    },
  );
}

/// generated route for
/// [_i13.SettingsPage]
class SettingsRoute extends _i20.PageRouteInfo<void> {
  const SettingsRoute({List<_i20.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i13.SettingsPage();
    },
  );
}

/// generated route for
/// [_i14.SignInPage]
class SignInRoute extends _i20.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i21.Key? key,
    _i21.VoidCallback? onResult,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>(
        orElse: () => const SignInRouteArgs(),
      );
      return _i14.SignInPage(key: args.key, onResult: args.onResult);
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key, this.onResult});

  final _i21.Key? key;

  final _i21.VoidCallback? onResult;

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
/// [_i15.SignUpPage]
class SignUpRoute extends _i20.PageRouteInfo<void> {
  const SignUpRoute({List<_i20.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i15.SignUpPage();
    },
  );
}

/// generated route for
/// [_i16.ThemeScreen]
class ThemeRoute extends _i20.PageRouteInfo<void> {
  const ThemeRoute({List<_i20.PageRouteInfo>? children})
    : super(ThemeRoute.name, initialChildren: children);

  static const String name = 'ThemeRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i16.ThemeScreen();
    },
  );
}

/// generated route for
/// [_i17.TokensScreen]
class TokensRoute extends _i20.PageRouteInfo<void> {
  const TokensRoute({List<_i20.PageRouteInfo>? children})
    : super(TokensRoute.name, initialChildren: children);

  static const String name = 'TokensRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i17.TokensScreen();
    },
  );
}

/// generated route for
/// [_i18.UiKitScreen]
class UiKitRoute extends _i20.PageRouteInfo<void> {
  const UiKitRoute({List<_i20.PageRouteInfo>? children})
    : super(UiKitRoute.name, initialChildren: children);

  static const String name = 'UiKitRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i18.UiKitScreen();
    },
  );
}

/// generated route for
/// [_i19.VerifyPage]
class VerifyRoute extends _i20.PageRouteInfo<VerifyRouteArgs> {
  VerifyRoute({
    _i21.Key? key,
    _i21.VoidCallback? onResult,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         VerifyRoute.name,
         args: VerifyRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'VerifyRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyRouteArgs>(
        orElse: () => const VerifyRouteArgs(),
      );
      return _i19.VerifyPage(key: args.key, onResult: args.onResult);
    },
  );
}

class VerifyRouteArgs {
  const VerifyRouteArgs({this.key, this.onResult});

  final _i21.Key? key;

  final _i21.VoidCallback? onResult;

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

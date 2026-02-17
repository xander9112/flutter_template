import 'dart:async';

import 'package:auth/src/_src.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/types/auth_messages_ios.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class VerifyPage extends StatefulWidget implements AutoRouteWrapper {
  const VerifyPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ScopeBuilder<AuthScope>.withPlaceholder(
      builder: (context, scope) {
        return ScopeProvider(holder: scope.localAuthScopeHolder, child: this);
      },
    );
  }

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  late final LocalAuthScopeHolder localAuthScopeHolder;

  @override
  void didChangeDependencies() {
    localAuthScopeHolder = ScopeProvider.of<AuthScope>(
      context,
    )!.localAuthScopeHolder;

    unawaited(localAuthScopeHolder.create());

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    unawaited(
      localAuthScopeHolder.drop(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authLocalizations = context.authLocalizations;

    return ScopeBuilder<LocalAuthScope>.withPlaceholder(
      builder: (context, scope) {
        return BlocProvider(
          create: (context) => scope.localAuthCubit(
            localizedReasonParam: authLocalizations.localizedReason,
            authMessagesParam: [
              AndroidAuthMessages(
                signInTitle: authLocalizations.biometrySignInTitle,
                signInHint: authLocalizations.biometrySignInHint,
                cancelButton: authLocalizations.biometryCancelButton,
              ),
              IOSAuthMessages(
                cancelButton: authLocalizations.biometryCancelButton,
                localizedFallbackTitle:
                    authLocalizations.biometryLocalizedFallbackTitle,
              ),
            ],
          ),
          child: Scaffold(
            body: SafeArea(
              child: BlocConsumer<LocalAuthCubit, LocalAuthState>(
                listenWhen: (previous, current) {
                  if (previous is LocalAuthCreate &&
                      current is LocalAuthCreate) {
                    return !previous.requestedUseBiometrics &&
                        current.requestedUseBiometrics;
                  }

                  return false;
                },
                listener: (context, state) async {
                  final useBiometric = await DialogService.showDialog<bool>(
                    child: UiConfirmDialog(
                      title: context.authLocalizations.useBiometricsToLogin,
                    ),
                  );

                  await context.read<LocalAuthCubit>().setUseBiometric(
                    useBiometric,
                  );
                },
                builder: (context, state) {
                  return switch (state) {
                    LocalAuthInitializing() => const UiProgressIndicator(),
                    LocalAuthCreate() => PinCodeCreateForm(
                      key: UniqueKey(),
                      isConfirm: state.isConfirm,
                      message: state.error?.code != null
                          ? context.authLocalizations.pinCodeError(
                              state.error!.code,
                            )
                          : null,
                      onComplete: context.localAuthCubit.createPin,
                    ),
                    LocalAuthEnter() => PinCodeEnterForm(
                      key: UniqueKey(),
                      useBiometric:
                          state.biometricSupportModel.status ==
                              BiometricStatus.available &&
                          (state.biometricSupportModel.useBiometric ?? false),
                      isFace: state.biometricSupportModel.isFace,
                      onComplete: context.localAuthCubit.enterPin,
                      message: state.error?.code != null
                          ? context.authLocalizations.pinCodeError(
                              state.error!.code,
                            )
                          : null,
                      onPressedReset: () => _onPressedReset(context),
                      onBiometricPressed: () {
                        context.localAuthCubit.biometricAuth();
                      },
                    ),
                  };
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onPressedReset(BuildContext context) async {
    final result = await DialogService.showDialog<bool>(
      child: UiConfirmDialog(
        title: context.authLocalizations.resetTitle,
        body: context.authLocalizations.resetDescription,
      ),
    );

    if (result ?? false) {
      await context.localAuthCubit.resetPinCode();
    }
  }
}

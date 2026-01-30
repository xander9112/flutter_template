import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class VerifyPage extends StatelessWidget implements AutoRouteWrapper {
  const VerifyPage({super.key, this.onResult});
  @override
  Widget wrappedRoute(BuildContext context) {
    return ScopeBuilder<AuthScope>.withPlaceholder(
      builder: (context, scope) {
        return BlocProvider<LocalAuthCubit>(
          create: (context) => scope.localAuthCubit..init(),
          child: this,
        );
      },
    );
  }

  final VoidCallback? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalAuthCubit, LocalAuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (!state.status.isReady) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (!state.hasPinCode) {
                return PinCodeCreateForm(
                  key: UniqueKey(),
                  isConfirm: state.isConfirm,
                  message: state.error,
                  onComplete: (pinCode) {
                    context.read<LocalAuthCubit>().createPin(pinCode);
                  },
                );
              }

              return PinCodeEnterForm(
                message: state.error,
                // useBiometric:
                // state.biometricSupportModel.status ==
                //     BiometricStatus.available &&
                // (state.biometricSupportModel.useBiometric ?? false),
                // isFace: state.biometricSupportModel.isFace,
                onBiometricPressed: () {
                  // context.read<LocalAuthCubit>().biometricAuth(
                  //   onResult,
                  // );
                },
                onPressedReset: context.read<LocalAuthCubit>().resetPinCode,
                onComplete: (pinCode) async {
                  await context.read<LocalAuthCubit>().enterPin(
                    pinCode,
                  );
                },
              );

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final result = await ScopeProvider.of<AuthScope>(
                          context,
                        )?.authManager.unlock('0000');

                        result?.fold((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.message)),
                          );
                        }, (r) {});
                      },
                      child: const Text('Verify'),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

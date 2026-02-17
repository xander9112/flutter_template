import 'package:auth/src/_src.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

@RoutePage()
class SignInPage extends StatelessWidget implements AutoRouteWrapper {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return switch (state) {
            SignInInitializing() => const Center(child: UiProgressIndicator()),

            Object() => Padding(
              padding: const EdgeInsets.all(Insets.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.authLocalizations.signInTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: Insets.xxxl),
                  const Spacer(),

                  ReactiveForm(
                    formGroup: state.form.form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiInputField<String>(
                          formControl: state.form.loginControl,
                          label: Text(context.authLocalizations.login),
                        ),
                        UiPasswordField(
                          formControl: state.form.passwordControl,
                          label: Text(context.authLocalizations.password),
                          onSubmitted: (control) =>
                              context.read<SignInCubit>().signIn(),
                        ),
                        switch (state) {
                          SignInError() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  state.error.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.error,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Object() => const SizedBox.shrink(),
                        },

                        const SizedBox(height: Insets.l),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReactiveFormConsumer(
                              builder: (context, formGroup, child) {
                                final disabled =
                                    formGroup.invalid || state.isLoading;
                                return UiButton(
                                  onPressed: !disabled
                                      ? context.read<SignInCubit>().signIn
                                      : null,
                                  child: Text(
                                    context.authLocalizations.signInTitle,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          };

          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           context.router.replace(const SignUpRoute());
          //         },
          //         child: const Text('Sign Up'),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           ScopeProvider.of<AuthScope>(
          //             context,
          //           )?.authManager.signIn('demo', 'demo');
          //         },
          //         child: const Text('Sign In'),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => context.authScope.signInCubit,
      child: this,
    );
  }
}

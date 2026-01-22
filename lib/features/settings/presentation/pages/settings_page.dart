import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings page')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: ScopeProvider.of<AuthScope>(context)?.authManager.lock,
                  title: Text('Lock'),
                ),
                ScopeBuilder<SettingsScope>.withPlaceholder(
                  builder: (context, scope) {
                    return ListTile(
                      onTap: () async {
                        final mode = await showModalBottomSheet<ThemeMode>(
                          context: context,
                          useRootNavigator: true,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Select theme'),

                                  ...ThemeMode.values.map((e) {
                                    return ListTile(
                                      title: Text(e.name),
                                      selected:
                                          scope.settingsCubit.state.themeMode ==
                                          e,
                                      onTap: () => context.router.pop(e),
                                    );
                                  }),
                                ],
                              ),
                            );
                          },
                        );

                        if (mode != null) {
                          scope.settingsCubit.changeTheme(mode);
                        }
                      },
                      title: Text('Change Theme'),
                      trailing: BlocBuilder<SettingsCubit, SettingsState>(
                        builder: (context, state) {
                          return Text(state.themeMode.name);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ScopeBuilder<AuthScope>.withPlaceholder(
            builder: (context, scope) {
              return StreamBuilder(
                initialData: scope.authManager.stage,
                stream: scope.authManager.stage,
                builder: (context, snapshot) {
                  if (scope.authManager.isSignIn) {
                    return ListTile(
                      titleTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onTap: ScopeProvider.of<AuthScope>(
                        context,
                      )?.authManager.signOut,
                      title: Text('SignOut', textAlign: TextAlign.center),
                    );
                  }

                  return SizedBox.shrink();
                },
              );
            },
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }
}

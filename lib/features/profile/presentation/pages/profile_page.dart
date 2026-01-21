import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

@RoutePage()
class ProfileRootPage extends StatelessWidget {
  const ProfileRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile page'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(SettingsRoute()),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => context.router.push(ProfileDataRootRoute()),
            title: Text('Profile data'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}

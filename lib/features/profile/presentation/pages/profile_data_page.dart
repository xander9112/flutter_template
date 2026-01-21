import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

@RoutePage()
class ProfileDataPage extends StatelessWidget {
  const ProfileDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile data page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(ProfileInfoRoute());
          },
          child: Text('Info'),
        ),
      ),
    );
  }
}

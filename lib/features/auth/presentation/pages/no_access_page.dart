import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class NoAccessPage extends StatefulWidget {
  const NoAccessPage({super.key});

  @override
  State<NoAccessPage> createState() => _NoAccessPageState();
}

class _NoAccessPageState extends State<NoAccessPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IAuthManager<UserEntity> authManager = ScopeProvider.of<AuthScope>(
      context,
    )!.authManager;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (authManager.remainingSeconds > 0)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'У вас нет доступа к приложению',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Разблокировка через: ${authManager.remainingSeconds}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              Expanded(child: Column()),
          ],
        ),
      ),
    );
  }
}

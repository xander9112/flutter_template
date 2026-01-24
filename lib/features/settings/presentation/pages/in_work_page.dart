import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/features/settings/_settings.dart';

class InWorkPage extends StatelessWidget {
  const InWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App in work')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            titleTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
            onTap: context.read<SettingsCubit>().changeWorkStatus,
            title: Text('Update', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

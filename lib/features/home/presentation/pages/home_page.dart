import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/_app.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    print('Did change: ${context.rootScope.appConfig}');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Center(child: Text('Home')),
    );
  }
}

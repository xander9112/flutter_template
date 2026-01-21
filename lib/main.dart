import 'package:quiz/runner/app_runner.dart';
import 'package:url_strategy/url_strategy.dart';

void main(List<String> arguments) {
  setPathUrlStrategy();

  print('MAIN');
  AppRunner(.prod).run(arguments);
}

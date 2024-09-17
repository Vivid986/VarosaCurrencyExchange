import 'package:get_it/get_it.dart';
import 'package:varosa_currency_exchange/core/routes/app_router.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  locator.registerSingleton<AppRouter>(AppRouter());
}

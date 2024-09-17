import 'package:auto_route/auto_route.dart';
import 'package:varosa_currency_exchange/core/routes/routes_path.dart';
import 'package:varosa_currency_exchange/features/home/presentation/screens/home_screen.dart';
import 'package:varosa_currency_exchange/widgets/no_internet_connection_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: '')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeScreenRoute.page,
          initial: true,
          path: RoutesPath.home,
        ),
        AutoRoute(
          page: NoInternetConnectionScreenRoute.page,
          path: RoutesPath.noInternetConnection,
        )
      ];

  // @override
  // List<AutoRouteGuard> get guards => [
  //       // optionally add root guards here
  //     ];
}

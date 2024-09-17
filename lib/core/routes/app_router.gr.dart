// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [NoInternetConnectionScreen]
class NoInternetConnectionScreenRoute extends PageRouteInfo<void> {
  const NoInternetConnectionScreenRoute({List<PageRouteInfo>? children})
      : super(
          NoInternetConnectionScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetConnectionScreenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoInternetConnectionScreen();
    },
  );
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

void pushRoute(dynamic path, BuildContext context) {
  final router = AutoRouter.of(context);
  path is String ? router.pushNamed(path) : router.pushPathState(path);
}

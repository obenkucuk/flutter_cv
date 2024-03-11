import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/splash/splash_view.dart';

part 'splash.g.dart';

@TypedGoRoute<SplashRoute>(path: '/', name: 'Splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

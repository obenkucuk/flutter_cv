import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'navigator_observer.dart';
import 'routes/main_shell.dart';
import 'routes/splash/splash.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  // final firstNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'First');
  // final secondNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Second');
  // final thirdNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Third');
  // final fourthNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Fourth');
  // final playerNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Player');
  //  final scaffoldKey = ref.watch(scaffoldScreenKeyProvider);

  return GoRouter(
    overridePlatformDefaultLocation: true,
    initialLocation: '/',
    observers: [MyNavigatorObserver()],
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    routes: [
      $splashRoute,
      $mainShellRouteData,
    ],
  );
});

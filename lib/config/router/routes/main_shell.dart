import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/tab_view_with_nav_bar/views/tab_view_with_nav_bar.dart';
import '../../../features/about/views/about_view.dart';
import '../../../features/education/views/education_view.dart';
import '../../../features/experience/views/experience_view.dart';
import '../go_router_provider.dart';
import '../navigator_observer.dart';

part 'main_shell.g.dart';
part 'tab/education/education.dart';
part 'tab/experience/experience.dart';
part 'tab/order/order.dart';
part 'tab/about/about.dart';

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    _aboutShellBranchData,
    _homeShellBranchData,
    _notificationShellBranchData,
    _ordersShellBranchData,
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      navigationShell;

  // static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  static const String $restorationScopeId = 'restorationScopeId';

  static final List<NavigatorObserver> $observers = <NavigatorObserver>[
    MyNavigatorObserver(),
  ];

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return TabViewWithNavBar(
      key: GlobalKey(debugLabel: 'TabViewWithNavBar'),
      navigationShell: navigationShell,
      children: children,
    );
  }
}

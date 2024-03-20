part of '../../main_shell.dart';

const _cookbookShellBranchData = TypedStatefulShellBranch<CookbookShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<CookbookRouteData>(
      path: '/portfolio',
      name: 'Portfolio',
      routes: [
        TypedGoRoute<StretchyHeaderRoute>(
          path: 'stretchy_header',
          name: 'Stretchy Header',
        ),
        TypedGoRoute<OverlapHeaderTabBarRoute>(
          path: 'overlap_header_tab_bar',
          name: 'Overlap Header Tab Bar',
        ),
      ],
    ),
  ],
);

class CookbookShellBranchData extends StatefulShellBranchData {
  const CookbookShellBranchData();
}

class CookbookRouteData extends GoRouteData {
  const CookbookRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CookbookView();
  }
}

class StretchyHeaderRoute extends GoRouteData {
  const StretchyHeaderRoute();

  static GlobalKey<NavigatorState> $parentNavigatorKey = navigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StretchyHeaderView();
  }
}

class OverlapHeaderTabBarRoute extends GoRouteData {
  const OverlapHeaderTabBarRoute();

  static GlobalKey<NavigatorState> $parentNavigatorKey = navigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OverlapHeaderTabBarView();
  }
}

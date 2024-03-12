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

part of '../../main_shell.dart';

const _aboutShellBranchData = TypedStatefulShellBranch<AboutShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AboutRoute>(
      path: '/obenkucuk',
      name: 'About',
      // routes: const [],
    ),
  ],
);

class AboutShellBranchData extends StatefulShellBranchData {
  const AboutShellBranchData();
}

class AboutRoute extends GoRouteData {
  const AboutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutView();
  }
}

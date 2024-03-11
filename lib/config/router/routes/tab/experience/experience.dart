part of '../../main_shell.dart';

const _notificationShellBranchData = TypedStatefulShellBranch<ExperienceShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<ExperienceRouteData>(
      path: '/experience',
      name: 'Experience',
      // routes: [],
    ),
  ],
);

@immutable
final class ExperienceShellBranchData extends StatefulShellBranchData {
  const ExperienceShellBranchData();

  static String $initialLocation = '/experience';
}

@immutable
final class ExperienceRouteData extends GoRouteData {
  const ExperienceRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExperinceView();
  }
}

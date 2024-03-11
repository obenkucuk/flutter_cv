part of '../../main_shell.dart';

const _homeShellBranchData = TypedStatefulShellBranch<EducationShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<EducationRoute>(
      path: '/education',
      name: 'Education',
      routes: [
        TypedGoRoute<AnimeDetailRoute>(
          path: ':malId',
          name: 'Anime Detail',
        ),
      ],
    ),
  ],
);

class EducationShellBranchData extends StatefulShellBranchData {
  const EducationShellBranchData();
}

class EducationRoute extends GoRouteData {
  const EducationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EducationView();
  }
}

class AnimeDetailRoute extends GoRouteData {
  final int? malId;

  const AnimeDetailRoute({this.malId});

  static GlobalKey<NavigatorState> $parentNavigatorKey = navigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('AnimeDetailRoute'),
      ),
    );
  }
}

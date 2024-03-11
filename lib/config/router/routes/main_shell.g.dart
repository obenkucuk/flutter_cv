// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_shell.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: MainShellRouteData.$restorationScopeId,
      navigatorContainerBuilder: MainShellRouteData.$navigatorContainerBuilder,
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/obenkucuk',
              name: 'About',
              factory: $AboutRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/education',
              name: 'Education',
              factory: $EducationRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':malId',
                  name: 'Anime Detail',
                  parentNavigatorKey: AnimeDetailRoute.$parentNavigatorKey,
                  factory: $AnimeDetailRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          initialLocation: ExperienceShellBranchData.$initialLocation,
          routes: [
            GoRouteData.$route(
              path: '/experience',
              name: 'Experience',
              factory: $ExperienceRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/portfolio',
              name: 'Portfolio',
              factory: $PortfolioRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $AboutRouteExtension on AboutRoute {
  static AboutRoute _fromState(GoRouterState state) => const AboutRoute();

  String get location => GoRouteData.$location(
        '/obenkucuk',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EducationRouteExtension on EducationRoute {
  static EducationRoute _fromState(GoRouterState state) =>
      const EducationRoute();

  String get location => GoRouteData.$location(
        '/education',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AnimeDetailRouteExtension on AnimeDetailRoute {
  static AnimeDetailRoute _fromState(GoRouterState state) => AnimeDetailRoute(
        malId: int.parse(state.pathParameters['malId']!),
      );

  String get location => GoRouteData.$location(
        '/education/${Uri.encodeComponent(malId!.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExperienceRouteDataExtension on ExperienceRouteData {
  static ExperienceRouteData _fromState(GoRouterState state) =>
      const ExperienceRouteData();

  String get location => GoRouteData.$location(
        '/experience',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PortfolioRouteDataExtension on PortfolioRouteData {
  static PortfolioRouteData _fromState(GoRouterState state) =>
      const PortfolioRouteData();

  String get location => GoRouteData.$location(
        '/portfolio',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

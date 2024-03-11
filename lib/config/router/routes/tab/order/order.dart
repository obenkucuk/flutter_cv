part of '../../main_shell.dart';

const _ordersShellBranchData = TypedStatefulShellBranch<PortfolioShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<PortfolioRouteData>(path: '/portfolio', name: 'Portfolio'),
  ],
);

class PortfolioShellBranchData extends StatefulShellBranchData {
  const PortfolioShellBranchData();
}

class PortfolioRouteData extends GoRouteData {
  const PortfolioRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PortfolioView(label: 'portfolio page');
  }
}

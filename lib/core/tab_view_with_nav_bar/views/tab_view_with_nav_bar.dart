import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/device_type.dart';
import '../../../config/theme/provider/provider.dart';
import '../widgets/desktop_mode_scaffold.dart';
import '../widgets/mobile_mode_scaffold.dart';

class TabViewWithNavBar extends StatelessWidget {
  const TabViewWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNavBar'),
        );

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  void goBranch(int index) {
    if (navigationShell.currentIndex == index) return;

    navigationShell.goBranch(
      index,
      initialLocation: navigationShell.currentIndex == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = ScreenType.getDeviceType(constraints);

        return switch (screenType) {
          ScreenType.mobile => MobileModeScaffold(
              currentIndex: navigationShell.currentIndex,
              onTap: goBranch,
              children: children,
            ),
          ScreenType.desktop => DesktopModeScaffold(
              currentIndex: navigationShell.currentIndex,
              onTap: goBranch,
              children: children,
            ),
        };
      },
    );
  }
}

class PortfolioView extends ConsumerWidget {
  const PortfolioView({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      key: const Key('OrdersPageView'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: const Text('Change'),
            onPressed: () {
              ref.read(myThemeProvider.notifier).changeTheme();
            },
          ),
        ],
      ),
    );
  }
}

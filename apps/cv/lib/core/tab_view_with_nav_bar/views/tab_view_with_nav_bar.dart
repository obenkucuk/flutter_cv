import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../config/screen_type.dart';
import '../../../config/theme/my_colors.dart';
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
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: context.myColors.scaffoldBackgroundColor,
      ),
      child: LayoutBuilder(
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
      ),
    );
  }
}

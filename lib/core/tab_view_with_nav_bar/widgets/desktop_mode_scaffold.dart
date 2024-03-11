import 'package:flutter/material.dart';

import 'animated_branch_container.dart';
import 'drawer_widget.dart';

@immutable
final class DesktopModeScaffold extends StatelessWidget {
  const DesktopModeScaffold({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.children,
  });

  final void Function(int) onTap;
  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + kToolbarHeight;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: top),
              child: DrawerWidget(onTap: onTap, currentIndex: currentIndex),
            ),
            const VerticalDivider(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: top),
                child: AnimatedBranchContainer(
                  currentIndex: currentIndex,
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

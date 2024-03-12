import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../config/screen_type.dart';
import '../models/navigation_rail_items.dart';
import 'my_info_widget.dart';
import 'navigation_tab_item.dart';

@immutable
final class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenType = ScreenType.getDeviceType(constraints);

        final padding = EdgeInsets.only(
          right: 24,
          bottom: kBottomNavigationBarHeight,
          top: screenType == ScreenType.mobile
              ? MediaQuery.of(context).padding.top + kToolbarHeight
              : 0,
        );

        return Padding(
          padding: padding,
          child: SizedBox(
            width: screenType == ScreenType.mobile ? screenWidth * 0.6 : 200,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...NavigationRailItems.values.mapIndexed((index, tab) {
                    return NavigationTabItem(
                      axis: Axis.vertical,
                      onTap: onTap,
                      tab: tab,
                      currentIndex: currentIndex,
                      index: index,
                    );
                  }),
                  const Spacer(),
                  const MyInfoWidget(crossAxisAlignment: CrossAxisAlignment.end),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

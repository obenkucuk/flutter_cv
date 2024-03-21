import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/icons/icons.dart';
import '../models/navigation_rail_items.dart';
import 'animated_branch_container.dart';
import 'drawer_widget.dart';
import 'my_info_widget.dart';
import 'navigation_tab_item.dart';

@immutable
final class MobileModeScaffold extends StatelessWidget {
  const MobileModeScaffold({
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
    return Scaffold(
      drawer: Drawer(
        child: Builder(
          builder: (context) {
            return DrawerWidget(
              onTap: (index) async {
                Scaffold.of(context).closeDrawer();
                await Future<void>.delayed(const Duration(milliseconds: 200));
                onTap(index);
              },
              currentIndex: currentIndex,
            );
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const MyInfoWidget(crossAxisAlignment: CrossAxisAlignment.center),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Builder(
                  builder: (context) {
                    return CupertinoButton(
                      padding: EdgeInsets.all(12.h),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      child: MyIcons.menuBurger.toWidget(size: 20),
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: AnimatedBranchContainer(
              currentIndex: currentIndex,
              children: children,
            ),
          ),
          SafeArea(
            top: false,
            child: Column(
              children: [
                const Divider(thickness: 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: NavigationRailItems.values.mapIndexed((index, tab) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: NavigationTabItem(
                        axis: Axis.horizontal,
                        onTap: onTap,
                        tab: tab,
                        currentIndex: currentIndex,
                        index: index,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

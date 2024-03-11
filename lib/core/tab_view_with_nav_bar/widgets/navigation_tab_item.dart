import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/text_styles.dart';
import '../models/navigation_rail_items.dart';

@immutable
final class NavigationTabItem extends StatelessWidget {
  const NavigationTabItem({
    super.key,
    required this.tab,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    required this.axis,
  });

  final Axis axis;
  final int index;
  final NavigationRailItems tab;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 6.h),
          if (axis == Axis.horizontal)
            IntrinsicWidth(
              child: Column(
                children: [
                  tab.icon.toWidget(size: 18),
                  SizedBox(width: 4.w),
                  Text(
                    tab.label.toLowerCase(),
                    style: s16W400.copyWith(
                      color: index == currentIndex
                          ? Theme.of(context).textTheme.bodySmall?.color
                          : primaryColor,
                      fontWeight: index == currentIndex ? FontWeight.bold : FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(
                    height: 2.h,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: index == currentIndex ? Colors.grey : Colors.transparent,
                        borderRadius: BorderRadius.circular(500),
                      ),
                    ),
                  ).animate().scaleX(),
                ],
              ),
            )
          else
            IntrinsicWidth(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      tab.icon.toWidget(size: 18),
                      SizedBox(width: 4.w),
                      Text(
                        tab.label.toLowerCase(),
                        style: s16W400.copyWith(
                          color: index == currentIndex
                              ? Theme.of(context).textTheme.bodySmall?.color
                              : primaryColor,
                          fontWeight: index == currentIndex ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(
                    height: 2.h,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: index == currentIndex ? Colors.grey : Colors.transparent,
                        borderRadius: BorderRadius.circular(500),
                      ),
                    ),
                  ).animate().slideX(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

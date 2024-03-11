import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/device_type.dart';
import '../../../config/icons/icons.dart';
import '../../../config/theme/text_styles.dart';

class EducationItemWidget extends StatelessWidget {
  const EducationItemWidget({
    super.key,
    required this.school,
    required this.locationAndYears,
    required this.department,
    required this.gpa,
    required this.icon,
  });

  final String school;
  final MyIcons icon;
  final String locationAndYears;
  final String department;
  final double gpa;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final smallTextStyle = s14W400.copyWith(color: primaryColor);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenType = ScreenType.getDeviceType(constraints);

        return Row(
          children: [
            icon.toWidget(size: 50),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MySelectableText(school, isExpanded: true, style: s18W700),
                      if (screenType == ScreenType.desktop)
                        MySelectableText(
                          locationAndYears,
                          isExpanded: true,
                          style: s16W700.copyWith(color: primaryColor),
                          textAlign: TextAlign.end,
                        ),
                    ],
                  ),
                  if (screenType == ScreenType.mobile)
                    MySelectableText(
                      locationAndYears,
                      style: smallTextStyle,
                    ),
                  MySelectableText(department, style: smallTextStyle),
                  MySelectableText(
                    'GPA: $gpa',
                    style: smallTextStyle,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Default constructor for [MySelectableText] is expanded.
class MySelectableText extends StatelessWidget {
  const MySelectableText(
    this.data, {
    super.key,
    this.isExpanded = false,
    this.flex = 1,
    this.maxLines = 1,
    this.style,
    this.textAlign,
  });

  final String data;
  final bool isExpanded;
  final int flex;
  final int maxLines;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final child = SelectableText(
      data,
      maxLines: maxLines,
      style: style,
      textAlign: textAlign,
    );

    return isExpanded ? Expanded(flex: flex, child: child) : child;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/my_selectable_text.dart';
import '../../../config/icons/icons.dart';
import '../../../config/screen_type.dart';
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

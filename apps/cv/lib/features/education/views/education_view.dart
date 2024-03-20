import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/icons/icons.dart';
import '../../../config/theme/text_styles.dart';
import '../widgets/education_item_widget.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ListView(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EDUCATION'.toLowerCase(), style: s24W700.copyWith(color: primaryColor)),
            const Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: .5,
                    child: Divider(),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const EducationItemWidget(
          icon: MyIcons.bounLogo,
          school: 'Bogazici University',
          department: 'Bachelor of Science in Civil Engineering',
          gpa: 2.94,
          locationAndYears: 'Istanbul, 2013-2019',
        ),
        SizedBox(height: 16.h),
        const EducationItemWidget(
          icon: MyIcons.ankaraLogo,
          school: 'Ankara University',
          department: 'Law School',
          gpa: 3.53,
          locationAndYears: 'Ankara, 2020-',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

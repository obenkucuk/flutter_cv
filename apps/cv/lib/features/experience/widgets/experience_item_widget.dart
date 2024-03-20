import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/text_styles.dart';
import '../models/experiences.dart';

class ExperienceItemWidget extends StatelessWidget {
  const ExperienceItemWidget({
    super.key,
    required this.experience,
  });

  final Experiences experience;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final smallTextStyle = s14W400.copyWith(color: primaryColor);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Text(experience.label, style: s18W700),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    experience.tasks.length,
                    (index) {
                      final task = experience.tasks[index];
                      return Text('• $task', style: smallTextStyle);
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
        Expanded(
          child: Text(experience.location, style: s16W700.copyWith(color: primaryColor)),
        ),
      ],
    );
  }
}

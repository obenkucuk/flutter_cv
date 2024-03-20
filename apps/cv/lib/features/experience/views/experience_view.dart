import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/text_styles.dart';
import '../models/experiences.dart';
import '../widgets/experience_item_widget.dart';

class ExperinceView extends StatelessWidget {
  const ExperinceView({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final padding = EdgeInsets.only(
      bottom: 16.h,
      left: 24.w,
      right: 24.w,
    );

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EXPERIENCE'.toLowerCase(), style: s24W700.copyWith(color: primaryColor)),
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
          ),
        ),
        // const AnimeDetailAppBar(),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          sliver: SliverList.builder(
            itemCount: Experiences.values.length,
            itemBuilder: (BuildContext context, int index) {
              final experience = Experiences.values[index];

              return ExperienceItemWidget(experience: experience);
            },
          ),
        ),
      ],
    );
  }
}

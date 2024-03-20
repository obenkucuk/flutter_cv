import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/router/routes/main_shell.dart';
import '../../../config/theme/text_styles.dart';

class CookbookView extends ConsumerWidget {
  const CookbookView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cookbook'.toLowerCase(),
                  style: s24W700.copyWith(color: Theme.of(context).primaryColor),
                ),
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
          SliverPadding(
            padding: const EdgeInsets.only(top: 16),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                childAspectRatio: 5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: CookbookExamples.values.length,
              itemBuilder: (context, index) {
                final example = CookbookExamples.values[index];

                return DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    onPressed: () => example.go(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          example.title,
                          style: s22W500,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum CookbookExamples {
  stretchyHeader,
  overlapHeaderTabBar,
  ;

  String get title {
    switch (this) {
      case stretchyHeader:
        return 'Stretchy Header';
      case overlapHeaderTabBar:
        return 'Overlap Header Tab Bar';
    }
  }

  void go(BuildContext context) {
    switch (this) {
      case stretchyHeader:
        return const StretchyHeaderRoute().go(context);
      case overlapHeaderTabBar:
        return const OverlapHeaderTabBarRoute().go(context);
    }
  }

  String get path => 'assets/README/$name.md';
}

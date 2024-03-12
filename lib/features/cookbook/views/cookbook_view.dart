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
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        Column(
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
        CupertinoButton(
          padding: EdgeInsets.symmetric(vertical: 12),
          onPressed: () => const StretchyHeaderRoute().go(context),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CookbookExamples.stretchyHeader.name,
                    style: s22W500,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum CookbookExamples {
  stretchyHeader,
  ;

  String get name {
    switch (this) {
      case stretchyHeader:
        return 'Stretchy Header';
      default:
        return '';
    }
  }
}

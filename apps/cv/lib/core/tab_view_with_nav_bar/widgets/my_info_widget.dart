import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/my_selectable_text.dart';
import '../../../config/theme/text_styles.dart';
import '../models/social_media_accounts.dart';

@immutable
final class MyInfoWidget extends StatelessWidget {
  const MyInfoWidget({
    super.key,
    required this.crossAxisAlignment,
  });

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SelectableText('Oben Küçük', style: s18W600, maxLines: 1),
        GestureDetector(
          onTap: () async {
            const mailAddress = 'obenkucuk@gmail.com';
            const subject = 'Hello Oben';
            const body = 'I would like to contact you about...';

            if (await canLaunchUrl(
              Uri.parse('mailto:$mailAddress?subject=$subject&body=$body'),
            )) {
              await launchUrl(Uri.parse('mailto:$mailAddress?subject=$subject&body=$body'));
            } else {}
          },
          child: Text(
            'obenkucuk@gmail.com',
            style: s16W500.copyWith(color: CupertinoColors.activeBlue),
            maxLines: 1,
          ),
        ),
        GestureDetector(
          onTap: () async {
            const telNo = '+905425815951';

            if (await canLaunchUrl(Uri.parse('tel:$telNo'))) {
              await launchUrl(Uri.parse('tel:$telNo'));
            } else {}
          },
          child: Text(
            '+905425815951',
            style: s16W500.copyWith(color: CupertinoColors.activeBlue),
            maxLines: 1,
          ),
        ),
        MySelectableText('Istanbul, TR', style: s16W500),
        const SizedBox(height: 12),
        const SocialMediAccountWidget(),
      ],
    );
  }
}

class SocialMediAccountWidget extends StatelessWidget {
  const SocialMediAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: SocialMediaAccounts.values.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: index == SocialMediaAccounts.values.length - 1 ? 0 : 4,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          final account = SocialMediaAccounts.values.elementAt(index);
          return GestureDetector(
            onTap: () async {
              if (await canLaunchUrl(account.url)) await launchUrl(account.url);
            },
            child: account.icon.toWidget(isColorful: true),
          );
        },
      ),
    );
  }
}

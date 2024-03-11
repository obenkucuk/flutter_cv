import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/gradient_text.dart';
import '../../../config/device_type.dart';
import '../../../config/theme/text_styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final screenType = ScreenType.getDeviceType(constraints);

        return ListView(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ABOUT'.toLowerCase(), style: s24W700.copyWith(color: primaryColor)),
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
            GradientText(
              'Welcome',
              style: s24W700.copyWith(fontSize: screenType == ScreenType.desktop ? 80 : 40),
            ),
            SizedBox(height: 16.h),
            Text(
              "My name is Oben Küçük, I'm a mobile developer based in Istanbul, TR. I have developed many types of mobile application from crypto-trading platform to music player for any kind of platforms.",
              style: s18W500,
            ),
            SizedBox(height: 16.h),
            Text(
              "I'm passionate about cutting-edge technologies and challenges. I'm always looking for new opportunities to improve my skills and learn new things.",
              style: s18W500,
            ),
          ],
        );
      },
    );
  }
}

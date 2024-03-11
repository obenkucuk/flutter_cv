// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';

enum MyIcons {
  corporateAlt,
  graduationCap,
  suitcaseAlt,
  menuBurger,
  user,

  //* University
  bounLogo,
  ankaraLogo,

  //* Programming Languages
  csharp,
  firebase,
  dartlang,
  flutter,
  swift,

  //* Social Media
  github,
  linkedin,
  medium,
  twitter,
  instagram,
  youtube,
  ;

  String get path => 'assets/icons/$name.svg';

  Widget toWidget({
    double? size,
    Color? color,
    bool isColorful = false,
  }) {
    return SvgWidget(
      path: path,
      color: color,
      size: size,
      isColorful: isColorful,
    );
  }
}

@immutable
final class SvgWidget extends StatelessWidget {
  const SvgWidget({
    super.key,
    required this.path,
    this.color,
    this.size,
    this.isColorful = false,
  });

  final String path;
  final Color? color;
  final double? size;
  final bool isColorful;
  @override
  Widget build(BuildContext context) {
    final defaultIconSize = 500 > 600 ? 20.0.r : 24.0.r;

    return SizedBox.square(
      dimension: size ?? defaultIconSize,
      child: SvgPicture.asset(
        path,
        colorFilter: isColorful
            ? null
            : ColorFilter.mode(
                color ?? Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
        height: size?.r ?? defaultIconSize,
        width: size?.r ?? defaultIconSize,
        semanticsLabel: path,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    );
  }
}

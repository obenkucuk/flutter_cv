import 'package:flutter/material.dart';

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
  final int? maxLines;
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

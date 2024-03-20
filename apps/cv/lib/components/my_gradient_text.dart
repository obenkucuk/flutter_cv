import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@immutable
final class MyGradientText extends HookWidget {
  final String data;
  final TextStyle style;

  const MyGradientText(
    this.data, {
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      Colors.blue,
      Colors.pink,
      Colors.green,
      Colors.amber,
      Colors.blue,
      Colors.pink,
      Colors.blue,
      Colors.pink,
      Colors.green,
    ];

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect rect) {
        return LinearGradient(colors: colors).createShader(rect);
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 600),
        style: style,
        child: Text(data),
      ),
    );
  }
}

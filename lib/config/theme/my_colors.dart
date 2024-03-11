import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
final class MyColors extends ThemeExtension<MyColors> with EquatableMixin {
  final Color primaryColor;
  final Color? canvasColor;
  final Color? scaffoldBackgroundColor;

  const MyColors({
    required this.primaryColor,
    this.canvasColor,
    this.scaffoldBackgroundColor,
  });

  @override
  ThemeExtension<MyColors> copyWith({
    Color? primaryColor,
    Color? canvasColor,
    Color? scaffoldBackgroundColor,
  }) {
    return MyColors(
      primaryColor: primaryColor ?? this.primaryColor,
      canvasColor: canvasColor ?? this.canvasColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      canvasColor: Color.lerp(canvasColor, other.canvasColor, t),
      scaffoldBackgroundColor:
          Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
    );
  }

  static const MyColors light = MyColors(
    primaryColor: CupertinoColors.systemGrey,
    canvasColor: Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: Color.fromARGB(255, 241, 241, 241),
  );

  static const MyColors dark = MyColors(
    primaryColor: CupertinoColors.systemGrey,
    canvasColor: Color.fromARGB(0, 0, 0, 0),
    scaffoldBackgroundColor: Color.fromARGB(255, 36, 36, 43),
  );

  @override
  List<Object?> get props => [
        primaryColor,
        canvasColor,
        scaffoldBackgroundColor,
      ];
}

extension MyColorsExtension on BuildContext {
  MyColors get myColors => Theme.of(this).extension<MyColors>()!;
}



///NOT: doğayla beğendik
// static const Color simSiyah = Color.fromARGB(255, 52, 51, 51);
//   static const Color kirikSiyah = Color.fromARGB(255, 36, 36, 43);
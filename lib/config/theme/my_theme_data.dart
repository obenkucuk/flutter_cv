// ignore_for_file: avoid_redundant_argument_values

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_colors.dart';

@immutable
final class MyThemeData extends Equatable {
  const MyThemeData({
    this.myColors = const MyColors(
      primaryColor: CupertinoColors.systemGrey,
    ),
  });

  final MyColors myColors;

  @override
  List<Object?> get props => [myColors];

  ThemeData get light {
    // final canvasColor = MyColors.light.canvasColor;
    final scaffoldBackgroundColor = MyColors.light.scaffoldBackgroundColor;
    final textColor = MyColors.dark.scaffoldBackgroundColor;
    final cupertinoTextStyle = GoogleFonts.inconsolata();
    final textStyle = GoogleFonts.inconsolata();

    return ThemeData(
      colorScheme: ColorScheme(
        primary: myColors.primaryColor,
        onPrimary: Colors.white,
        secondary: Colors.amber,
        onSecondary: Colors.purple,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.green,
        onBackground: Colors.purpleAccent,
        surface: Colors.indigo,
        onSurface: Colors.yellow,
        brightness: Brightness.dark,
      ),

      primaryColor: myColors.primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,

      typography: Typography.material2021(platform: defaultTargetPlatform),
      extensions: const <ThemeExtension<dynamic>>[MyColors.light],

      //* splash: efektini kapatmak için ve highlight: tıklandığında oluşan yuvarlak efekti kapatmak için
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      dividerTheme: DividerThemeData(
        color: myColors.primaryColor,
        thickness: 0.5,
        space: 0,
        indent: 0,
        endIndent: 0,
      ),

      drawerTheme: DrawerThemeData(
        elevation: 0,
        backgroundColor: scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),

      cupertinoOverrideTheme: CupertinoThemeData(
        primaryContrastingColor: Colors.black,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        barBackgroundColor: CupertinoColors.systemGrey6,
        applyThemeToAll: true,
        textTheme: CupertinoTextThemeData(
          primaryColor: myColors.primaryColor,
          textStyle: cupertinoTextStyle,
          actionTextStyle: cupertinoTextStyle,
          pickerTextStyle: cupertinoTextStyle,
          navTitleTextStyle: cupertinoTextStyle,
          navActionTextStyle: cupertinoTextStyle,
          navLargeTitleTextStyle: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),

      /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
      textTheme: TextTheme(
        /// Label TextTheme
        labelSmall: textStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
        labelMedium:
            textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
        labelLarge: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),

        /// Body TextTheme
        bodySmall: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
        bodyMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
        bodyLarge: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textColor),

        /// Title TextTheme
        titleSmall: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
        titleMedium:
            textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
        titleLarge: textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),

        /// Headline TextTheme
        headlineSmall:
            textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: textColor),
        headlineMedium:
            textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w400, color: textColor),
        headlineLarge:
            textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w400, color: textColor),

        /// Display TextTheme
        displaySmall:
            textStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400, color: textColor),
        displayMedium:
            textStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400, color: textColor),
        displayLarge:
            textStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400, color: textColor),
      ),
    );
  }

  ThemeData get dark {
    // final canvasColor = MyColors.dark.canvasColor;
    final scaffoldBackgroundColor = MyColors.dark.scaffoldBackgroundColor;

    final textColor = MyColors.light.scaffoldBackgroundColor;
    final cupertinoTextStyle = GoogleFonts.inconsolata();
    final textStyle = GoogleFonts.inconsolata();

    return ThemeData(
      colorScheme: ColorScheme(
        primary: myColors.primaryColor,
        onPrimary: Colors.white,
        secondary: Colors.amber,
        onSecondary: Colors.purple,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.green,
        onBackground: Colors.purpleAccent,
        surface: Colors.indigo,
        onSurface: Colors.yellow,
        brightness: Brightness.dark,
      ),

      primaryColor: myColors.primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,

      typography: Typography.material2021(platform: defaultTargetPlatform),
      extensions: const <ThemeExtension<dynamic>>[MyColors.dark],

      drawerTheme: DrawerThemeData(
        elevation: 0,
        backgroundColor: scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),

      dividerTheme: DividerThemeData(
        color: myColors.primaryColor,
        thickness: 0.5,
        space: 0,
        indent: 0,
        endIndent: 0,
      ),

      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor: scaffoldBackgroundColor,
        applyThemeToAll: true,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: myColors.primaryColor,
          textStyle: cupertinoTextStyle,
          actionTextStyle: cupertinoTextStyle,
          pickerTextStyle: cupertinoTextStyle,
          navTitleTextStyle: cupertinoTextStyle,
          navActionTextStyle: cupertinoTextStyle,
          navLargeTitleTextStyle: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: MyColors.light.scaffoldBackgroundColor,
          ),
        ),
      ),

      /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
      textTheme: TextTheme(
        /// Label TextTheme
        labelSmall: textStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
        labelMedium:
            textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
        labelLarge: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),

        /// Body TextTheme
        bodySmall: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
        bodyMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
        bodyLarge: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textColor),

        /// Title TextTheme
        titleSmall: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
        titleMedium:
            textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
        titleLarge: textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),

        /// Headline TextTheme
        headlineSmall:
            textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: textColor),
        headlineMedium:
            textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w400, color: textColor),
        headlineLarge:
            textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w400, color: textColor),

        /// Display TextTheme
        displaySmall:
            textStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400, color: textColor),
        displayMedium:
            textStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400, color: textColor),
        displayLarge:
            textStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400, color: textColor),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'my_theme_data.dart';

@immutable
final class ThemeState extends Equatable {
  const ThemeState({
    required this.themeMode,
    required this.myThemeData,
  });

  final ThemeMode themeMode;
  final MyThemeData myThemeData;

  ThemeState copyWith({
    ThemeMode? themeMode,
    MyThemeData? myThemeData,
  }) =>
      ThemeState(
        themeMode: themeMode ?? this.themeMode,
        myThemeData: myThemeData ?? this.myThemeData,
      );

  factory ThemeState.initial() => const ThemeState(
        themeMode: ThemeMode.light,
        myThemeData: MyThemeData(),
      );

  @override
  List<Object> get props => [themeMode, myThemeData];
}

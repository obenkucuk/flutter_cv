import 'package:flutter/material.dart';

enum ScreenType {
  mobile,
  desktop,
  ;

  static ScreenType getDeviceType(BoxConstraints constraints) =>
      constraints.maxWidth > 800 ? desktop : mobile;
}

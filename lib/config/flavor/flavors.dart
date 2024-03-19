// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum Flavors {
  DEVELOPMENT,
  PRODUCTION,
  STAGING,
  ;

  String get bannerName {
    switch (this) {
      case Flavors.DEVELOPMENT:
        return 'DEV';
      case Flavors.PRODUCTION:
        return 'PROD';
      case Flavors.STAGING:
        return 'STAG';
    }
  }

  Color get bannerColor {
    switch (this) {
      case Flavors.DEVELOPMENT:
        return Colors.redAccent;
      case Flavors.PRODUCTION:
        return Colors.greenAccent;
      case Flavors.STAGING:
        return Colors.purpleAccent;
    }
  }

  bool get debugShowCheckedModeBanner {
    switch (this) {
      case Flavors.DEVELOPMENT:
        return true;
      case Flavors.PRODUCTION:
        return false;
      case Flavors.STAGING:
        return true;
    }
  }
}

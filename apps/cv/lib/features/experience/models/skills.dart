import '../../../config/icons/icons.dart';

enum Skills {
  flutter,
  dartlang,
  swift,
  swiftui,
  firebase,
  csharp,
  ;

  String get label {
    switch (this) {
      case Skills.flutter:
        return 'Flutter';
      case Skills.dartlang:
        return 'Dart';
      case Skills.swift:
        return 'Swift';
      case Skills.swiftui:
        return 'Swift UI';
      case Skills.csharp:
        return 'C Sharp';
      case Skills.firebase:
        return 'Firebase';
    }
  }

  MyIcons get icon {
    switch (this) {
      case Skills.flutter:
        return MyIcons.flutter;
      case Skills.dartlang:
        return MyIcons.dartlang;
      case Skills.swift:
        return MyIcons.swift;
      case Skills.swiftui:
        return MyIcons.swift;
      case Skills.csharp:
        return MyIcons.csharp;
      case Skills.firebase:
        return MyIcons.firebase;
    }
  }
}

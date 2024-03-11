import '../../../config/icons/icons.dart';

enum NavigationRailItems {
  about,
  education,
  experiences,
  portfolio;

  String get label => switch (this) {
        about => 'About',
        education => 'Education',
        experiences => 'Experience',
        portfolio => 'Portfolio'
      };

  MyIcons get icon => switch (this) {
        about => MyIcons.user,
        education => MyIcons.graduationCap,
        experiences => MyIcons.corporateAlt,
        portfolio => MyIcons.suitcaseAlt
      };
}

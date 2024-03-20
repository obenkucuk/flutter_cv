import '../../../config/icons/icons.dart';

enum NavigationRailItems {
  about,
  education,
  experiences,
  cookbook;

  String get label => switch (this) {
        about => 'About',
        education => 'Education',
        experiences => 'Experience',
        cookbook => 'Cookbook'
      };

  MyIcons get icon => switch (this) {
        about => MyIcons.user,
        education => MyIcons.graduationCap,
        experiences => MyIcons.corporateAlt,
        cookbook => MyIcons.suitcaseAlt
      };
}
